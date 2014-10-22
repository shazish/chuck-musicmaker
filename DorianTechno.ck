// **************************************************************************
// Assignment_3_DorianTechno.ck
// Automatic Dorian Melody Creation, simple and sweet with little constraints
// now with techno drums
// **************************************************************************

// Load D Dorian mode
[50, 52, 53, 55, 57, 59, 60, 62] @=> int Dorian[];

// Define samples and assign to a master buffer
Gain master => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

// Define oscilators
SinOsc ChordRoot => dac;
SinOsc ChordThird => Pan2 ThirdPan => dac; // will slowly pan this note
SinOsc ChordFifth => Pan2 FifthPan => dac; // and this one
SinOsc Melody => dac;
SinOsc Melody2 => Pan2 Melody2Pan => dac;

// Load kick and hat samples
me.dir() +"/audio/kick_01.wav" => kick.read;
me.dir() +"/audio/hihat_01.wav" => hihat.read;

// use a battery of snare samples
string snare_samples[3];
me.dir() + "/audio/snare_01.wav" => snare_samples[0];
me.dir() + "/audio/snare_02.wav" => snare_samples[1];
me.dir() + "/audio/snare_03.wav" => snare_samples[2];

// Silence the samples
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

// Define first note and initialize sequencer counter
0 => int Note;
0 => int counter;

// Define tempo to a quarter (try it on 0.20)
0.25 => float tempo;

// Set volume of Oscillators and samples, don't saturate the DAC!
0.1 => ChordRoot.gain;
0.1 => ChordThird.gain;
0.1 => ChordFifth.gain;
0.2 => Melody.gain;
0.1 => Melody2.gain;
0.45 => master.gain;

// Print Program's name
<<< "Assignment_3_DorianTechno" >>>;

// Main loop X 5
for(0 => int indexA; indexA < 5; indexA++)
{
    // print the name of the D section
    <<<"Constrained melodies over D">>>;
    0 => float Pan;
    // do 12 quarter notes
    for(0 => int i; i < 12; i++)
    {
        // Set the initial panning of third and fifth
        Pan => ThirdPan.pan;
        (Pan * -1) => FifthPan.pan;
        
        // make a D chord
        Std.mtof(Dorian[0]) => ChordRoot.freq;
        Std.mtof(Dorian[2]) => ChordThird.freq;
        Std.mtof(Dorian[4]) => ChordFifth.freq;
        
        // trow the coin to get the direction of the melody
        Math.random2(0, 1) => int UpDwn;

        // if the movement is down move a step down
        if(UpDwn == 0)
        {
            if(Note == 0) // if we are at 0 roll up the sequence
                6 => Note;     
            else // otherwise move down
                Note--;
        }
        
        // if the movement is up move a step up
        if(UpDwn == 1)
        {
           if(Note == 6) //if we are at 6 roll down the sequence
            0 => Note;
           else // otherwise move up
            Note++;
        }    
        
        // Sound the note an octave above
        Std.mtof(Dorian[Note] + 12) => Melody.freq;
        
        // Make techno sounds
        // check the beat we are in
        counter % 8 => int beat;

        if(beat == 0) // kick
        {
            0 => kick.pos;
            1 => kick.rate;
        }

        if(beat == 4) // reverse kick
        {
            kick.samples() => kick.pos;
            -1.0 => kick.rate;
        }
        
        if((beat == 2) || (beat == 6)) // snare
        {
            0 => snare.pos;
            Math.random2(0, snare_samples.cap() - 1) => int which; // select a snare
            snare_samples[which] => snare.read;
            
        }
       
        0 => hihat.pos; // hi hat    
        Math.random2f(0.2, 0.1) => hihat.gain;
        Math.random2f(0.2, 1.8) => hihat.rate;
    
        // Mantain the note a quarter
        tempo::second => now;
        
        //Pan the chord a little bit
        Pan + 0.08 => Pan;
        
        // add to the beat counter
        counter++;
    }
    
    // Print the name of the C section
    <<<"Random melodies over C">>>;
    
    //Reset panning to center
    0 => Pan;

    // Do 12 quarter notes
    for(0 => int i; i < 12; i++)
    {
        //Pan the third and the fifth to oppposite sides
        Pan => ThirdPan.pan;
        (Pan * -1) => FifthPan.pan;
        // Sound a C chord
        Std.mtof(Dorian[6] - 12) => ChordRoot.freq; // this C needs to be an octave below
        Std.mtof(Dorian[1]) => ChordThird.freq;
        Std.mtof(Dorian[3]) => ChordFifth.freq;

        // Move the main melody randomly an octave above
        Std.mtof(Dorian[Math.random2(0,6)] + 12) => Melody.freq;
        // Move and pan the second melody randomly an octave above, 
        // the last note will be mantained through the next section
        // to make the D chord a little more interesting
        Std.mtof(Dorian[Math.random2(0,6)] + 12) => Melody2.freq;
        Math.random2(-1, 1) => Melody2Pan.pan;

        // Make techno sounds ver 2        
        // check the beat we are in
        counter % 8 => int beat;
    
        if((beat == 0) || (beat ==4)) // kick
        {
            0 => kick.pos;
            1 => kick.rate;
        }

        if((beat == 2) || (beat ==6)) // snare
        {
            0 => snare.pos;
            Math.random2f(0.7, 1.3) => snare.rate;
        }

        0 => hihat.pos;    // hi hat
        0.2 => hihat.gain;
        Math.random2f(0.2, 1.8) => hihat.rate;

        // Mantain the note a quarter
        tempo::second => now;

        //Pan the chord a little bit
        Pan + 0.08 => Pan;
        
        // add to the beat counter
        counter++;
    }
} // end of the main loop X 5