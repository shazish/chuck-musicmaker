// final_assignment_8_PREY
// osc.ck
// Realized as I was packaging up this project that I forgot to include any Oscillators
// so I added this 4 part Bass oscillator that plays behind the melody
// it use the same logic for picking a 'melody' but because it's random
// it will play a different 'melody'.
//
SawOsc s => Gain master => dac;
TriOsc m => master => dac;
SinOsc r => master => dac;
SinOsc w => master => dac;

.01 => master.gain;

.2 => s.gain => m.gain => r.gain => w.gain;


[42,38,45,50] @=> int melodyNotes[];

BPM tempo;
tempo.wholeNote => dur wholeNote;

while ( true ) 
{
    
    tempo.halfNote => dur half;
    tempo.quarterNote => dur quarter;
    tempo.eighthNote => dur eighth;
    tempo.wholeNote => dur whole;
    
    Math.random2( 0, melodyNotes.cap()-1 ) => int iLoc;
    
    Math.random2(1,15)  => int ranRan;
    2 => int howMany;
    quarter => dur howLong;
    1=>ranRan;
    
    // add some variety in how long notes are held for and 
    // how many notes of the same length are played in a row
    if ( ranRan < 9 ) { 
        quarter => howLong; 
        2 => howMany;
        }
        else if ( ranRan < 11 )  { 
            if ( Math.random2(0,2) == 0 )
            { 2 => howMany; }
            else
            { 4 => howMany; }
            eighth => howLong; 
         }
        else if ( ranRan < 13 )  { 
            half => howLong; 
            1 => howMany;
        }
        else if ( ranRan < 14 )  { 
            whole => howLong; 
            1 => howMany;
        }
        else {
               0 => howMany;
        }
    
    for ( 1 => int i; i <= howMany; i++ )
    {
         Std.mtof(melodyNotes[iLoc]) => s.freq;
         Std.mtof(melodyNotes[iLoc]) => m.freq;
         Std.mtof(melodyNotes[iLoc]) => r.freq;
         Std.mtof(melodyNotes[iLoc])  => w.freq;
         
         howLong => now;
     }
     
 }