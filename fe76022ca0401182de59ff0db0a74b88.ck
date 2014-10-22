<<<"p3assigment_CV_week3_mktechno">>>;

//define oscillators and sound buffers, assign them to master
Gain master => dac;
//2 oscillators in array
SinOsc Vox[2];
Vox[0] => Pan2 pn1 => master;
Vox[1] => Pan2 pn2 => master;
//2 audio files in array; sound of 2nd file will be reversed
SndBuf2 Beats[2];
Beats[0] => Pan2 pn3 => master;
Beats[1] => Pan2 pn4 => master;

//define base melody contour, with only allowed midi frequensies
[53,50,57,62,55,59,57,53,55,57,55,53,52,53,52,50] @=> int base_melody_contour[];
// define inverse of note lengths of base melody, relarive to the quarter
[2.0,1.0,2.0,0.5,1.0,1.0,1.0,2.0,2.0,2.0,2.0,2.0,2.0,1.0,2.0,2.0,0.25] @=>float lengths[];

//select audio files for beats
[me.dir() + "/audio/stereo_fx_04.wav",me.dir() + "/audio/stereo_fx_05.wav"] @=> string audiofile[];
audiofile[0] => Beats[0].read;
audiofile[1] => Beats[1].read;

/*In this exercise, I put more focus on the composition, instead of language constructs.
I define first an introduction, in order to show what the base melody is (frequencies
and rhythm.
The following while loop, which is limited in time, adds a second voice and 2 beats.
In this loop, I have adopted a flat rhythm (only quarters) to avoid compexity that
doesn't show language features (different rhythm for first voice and the rest _  
Therefore I use "lengths" array only once in this exercise.).
I reverse the sound of weak beats, namely Beat[1], and I use % to determine if
the current beat is strong or not.
I use stereo files for beats, but the base note duration is too short for enjoying
stereo...
I couldn't imagine a smooth end for this exercise, so it ends quite abruptly.
*/

//define base note length 
0.25 => float quarter;
//define silence to make code clear
0 => float silence;

//define music duration    
now + 30::second =>time music_duration;

//music section

//introduction: only the theme: all except for 1st voice must be silent

silence => Vox[1].gain;
silence => Beats[0].gain;
silence => Beats[1].gain;

//index is used for indexing melody: because it is used 2x, I prefer to calculate 1x

for (0=>int i; i<base_melody_contour.cap(); i++)
{
    (i % base_melody_contour.cap()) => int index;
    Std.mtof((base_melody_contour[index])) => Vox[0].freq;
    0.5 => Vox[0].gain; 
    //I used inverse note lenghth in the hope that I can mix it with other tempo   
    (1/(lengths[index]))::second => now;
}
.5 ::second => now;


// section for loop until end of music_duration

0.9 => master.gain;
//wake up the second voice and the beats by allowing a positive gain
.2 => Vox[1].gain;
.5 => Beats[0].gain;
.5 => Beats[1].gain;
//Panning voices and beats separately
 Math.random2f(-1.0,1.0) => pn1.pan;
 Math.random2f(-1.0,1.0) => pn2.pan;
 Math.random2f(-1.0,1.0) => pn3.pan;
 Math.random2f(-1.0,1.0) => pn4.pan;

//below, the time-limited loop
while (now < music_duration) 
{  
    //melody sequence with week 3 features
    for (0=>int i; i+1<base_melody_contour.cap(); i++)
    
    {
        (i % base_melody_contour.cap()) => int index;
        Std.mtof(base_melody_contour[index]) => Vox[0].freq;
        // 2nd voice is some octaves higher than first and 1 step further in melody    
        Std.mtof((base_melody_contour[index+1])+(12*Math.random2(1,3))) =>Vox[1].freq;
        //Beats: this "if" sets a volume and freq on the first beat of every measures from audio
        //position heads
        0 => Beats[0].pos;
        Beats[1].samples() => Beats[1].pos;
        
        if (i % 4 == 0)
        {
            0.9 => Beats[0].gain;
            0 => Beats[1].gain;
            Math.random2f(12,29) => Beats[0].rate;

        }
        else
            //the "else" is to reestablish second, third amd fourth beats    
            {
                0.9 => Beats[1].gain;
                0 => Beats[0].gain;
                //abs value of rate must be high because note length is short
                Math.random2f(-12,-9) => Beats[1].rate;

            };
        quarter::second =>now;
    }
}

