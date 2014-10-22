// final_assignment_8_PREY
// score2.ck
// air traffic control of composition. Rhythm controlled by BPM temp class

BPM tempo;

100.0 => float beat;
tempo.tempo(beat); 

// *** play the intro, bringing in instruments one at a time

// bring in some tubal bells
Machine.add(me.dir()+"/cowbell.ck") => int bellsID;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;


// add in  underlying drone voices
Machine.add(me.dir()+"/drones.ck") => int dronesID;

// kick up the beat 
Machine.add(me.dir()+"/kick.ck") => int kickID;

tempo.wholeNote => now;
tempo.wholeNote => now;

// bring in a snare  
Machine.add(me.dir()+"/snare.ck") => int snareID;
tempo.wholeNote => now;
tempo.wholeNote => now;

// bring in toms 
Machine.add(me.dir()+"/toms.ck") => int tomsID;
tempo.wholeNote => now;
tempo.wholeNote => now;

// add the bass oscillators
Machine.add(me.dir()+"/osc.ck") => int oscID;
tempo.wholeNote => now;
tempo.wholeNote => now;

// *** Time for a melodic break - or a bridge or whatever you want to call it

// add the melody, turn off tom and drones so its cleaner
Machine.add(me.dir()+"/multi.ck") => int multiID;
Machine.remove(tomsID);
Machine.remove(dronesID);

tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;
tempo.wholeNote => now;

// *** Break is over, bring back remaining instruments and play the outro

// bring back the hiHat, Toms and Drones
Machine.add(me.dir()+"/hat.ck") => int hatID;
Machine.add(me.dir()+"/toms.ck") => int tomsID2;
Machine.add(me.dir()+"/drones.ck") => int dronesID2;

// Shut off the bass, melody instruments, and kick
Machine.remove(oscID);
Machine.remove(multiID);
Machine.remove(kickID);

// bit by bit declutter the arrangement until it ends as it started
tempo.wholeNote => now;
tempo.wholeNote => now;
Machine.remove(dronesID2);
tempo.wholeNote => now;
tempo.wholeNote => now;
Machine.remove(snareID);
Machine.remove(tomsID2);
tempo.halfNote => now;
Machine.remove(hatID);
Machine.remove(bellsID);
