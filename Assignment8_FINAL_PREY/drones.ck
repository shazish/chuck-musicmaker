// final_assignment_8_PREY
// drones.ck

// 4 drone voices
VoicForm singerDrones[4];

NRev droneRev => Gain master => dac;

singerDrones.cap() => int droneCount; // droneCount is set to the # of drone voices created

for( 0=> int i; i < droneCount; i++ )
{
    singerDrones[i] => droneRev;
    .7/droneCount => singerDrones[i].gain;
}

// initial drone notes
[26,38,45,50] @=> int drones[];

.25 => droneRev.mix;

BPM tempo;
tempo.wholeNote => dur wholeNote;

// set the phonemes to be sung
["eee","eee","ooo"] @=> string phonemes[];

while ( true )
{
     // loop 4 times, set pitch and phoneme for one voice each iteration
     for (  0=>int ii; ii < singerDrones.cap(); ii++ )
    {
        .06 => singerDrones[ii].vibratoGain;
        Std.mtof(drones[Math.random2(0,droneCount-1)]) => float droneFreq;
        
        //    if ( Math.random2(0,4) < 3 ) 
        Math.random2(1,10) => int pitchRandom;
        Math.random2(0,2) => int phonemeRandom;

        // set the phoneme for this drone voice
        phonemes[phonemeRandom] => singerDrones[ii].phoneme;  
        
       if ( pitchRandom < 6 ) 
       {
           droneFreq * 2 => singerDrones[ii].freq;
       }
       else
       {
           if ( pitchRandom < 8 )
           {
               droneFreq / 2 => singerDrones[ii].freq;
           }
           else
           { 
               droneFreq *3 => singerDrones[ii].freq;
           }
       }
   .1 => singerDrones[ii].gain;
    }
   wholeNote => now;
}
