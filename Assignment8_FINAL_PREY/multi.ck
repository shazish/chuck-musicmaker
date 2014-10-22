// final_assignment_8_PREY
// The instrument set is borrowed from inclass midi keyboard code
// but the scale is different
// I added code to play a melody

StifKarp s => Gain master => dac;
Mandolin m => master => dac;
Rhodey r => master => dac;
Wurley w => master => dac;

.05 => master.gain;

[42,38,45,50] @=> int melodyNotes[];

BPM tempo;
tempo.wholeNote => dur wholeNote;

while ( true ) 
{
    
    tempo.halfNote => dur half;
    tempo.quarterNote => dur quarter;
    tempo.eighthNote => dur eighth;
    tempo.wholeNote => dur whole;
    
//.25::second => dur quarter;
//quarter / 2 => dur eighth;
//quarter * 2 => dur half;
//quarter * 4 => dur whole;

    Math.random2( 0, melodyNotes.cap()-1 ) => int iLoc;
    Math.random2f( .3, .7)   => float iVelocity;
    
    Math.random2(1,15)  => int ranRan;
    2 => int howMany;
    quarter => dur howLong;
    
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
         Std.mtof(melodyNotes[iLoc])   => r.freq;
         Std.mtof(melodyNotes[iLoc])  => w.freq;
         
         iVelocity => s.noteOn;
         iVelocity => m.noteOn;
         iVelocity => r.noteOn;
         iVelocity => w.noteOn;

         .4 => s.gain => m.gain => r.gain => w.noteOn;

     howLong => now;
     }
     
 }