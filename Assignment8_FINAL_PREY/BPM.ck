// assignment_8_PREY
// BPM.ck
// global BPM conductor Class
// *** modified to ignore input parameter and set
// quarterNote value to .625::seconds (per assignment rubric)
// other note values are calculated based on quarter note
// note values are still accessible from other ck files and functions
public class BPM
{
    // global variables
    dur myDuration[4];
    static dur wholeNote, halfNote, quarterNote, eighthNote, sixteenthNote, thirtysecondNote;

    fun void tempo(float beat)  {
        // beat is BPM, example 120 beats per minute
        
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => quarterNote;
        quarterNote*2 => halfNote;
        quarterNote*4 => wholeNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        quarterNote*0.5 => thirtysecondNote;
        
        // store data in array
        [wholeNote, halfNote, quarterNote, eighthNote, sixteenthNote, thirtysecondNote] @=> myDuration;
    }
}

