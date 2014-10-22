// score.ck
// Exotic polyrhythmics
// Final project


drum mydrum; 
fx myfx;
stifkard mystifkard;
bass mybass;
flute myflute;
BPM tempo;
tempo.tempo(192.0);

/*

// bass slap intro
spork ~ mybass.playback(20, 38, 2, 2); // int duration, int note, float ontime, float offtime)
5::second=> now;

// drum joins
spork ~ mydrum.playback(0,5, 0.13);
5::second=> now;

// drum rhythm change
// stifkard joins
spork ~ mydrum.playback(2, 10, 0.13);
spork ~ mystifkard.playback(10, 1, 0.2); // duration, timestretch, gain
spork ~ myflute.playback(57, 6); // note, length
10::second=> now;

spork ~ mystifkard.playback(4, 1, 0.4); // duration, timestretch, gain
5::second=> now;

// exotic drum rhythm kicks in
spork ~ myfx.fxPlayback(14, 1.42, 2, 0); // int duration, float rate_set, float silent
spork ~ mydrum.playback(3, 10, 0.4); // pattern, length
spork ~ mybass.playback(15, 63, 0.5, 1.5);
17::second=> now;


// DRUM RHYTHM TIME CHANGE!!
spork ~ myflute.playback(70, 20); // note, length
2::second=> now;
spork ~ myfx.fxPlayback(15, 1.42, 1.5, 0); // int duration, float rate_set, float silent
spork ~ mystifkard.playback(15, 0.75, 0.12); // duration, timestretch
spork ~ mydrum.playback(4, 15, 0.4); // pattern, length
15::second=> now;

// Break down
//spork ~ mystifkard.playback(5, 1, 0.10); // duration, timestretch
// --
*/
spork ~ myfx.fxPlayback(3, 1.42, 1.5, 1); // int duration, float rate_set, float silent
spork ~ mydrum.playback(5, 3, 0.4); // pattern, length
3::second=> now;

spork ~ myfx.fxPlayback(15, 1.42, 1.5, 0); // int duration, float rate_set, float silent
spork ~ mystifkard.playback(15, 0.75, 0.10); // duration, timestretch
spork ~ mydrum.playback(6, 15, 0.4); // pattern, length
15::second=> now;
 
spork ~ myfx.fxPlayback(7.5, 1.30, 1.5, 0); // int duration, float rate_set, float silent
spork ~ mystifkard.playback(7.5, 1, 0.18); // duration, timestretch
spork ~ mydrum.playback(3, 7, 0.4); // pattern, length
7.5::second=> now;

spork ~ myfx.fxPlayback(16, 1.42, 1.5, 0); // int duration, float rate_set, float silent
spork ~ mystifkard.playback(4, 1, 0.12); // duration, timestretch
spork ~ mydrum.playback(4, 6, 0.4); // pattern, length
6::second=> now;
spork ~ mystifkard.playback(12, 0.625, 0.12); // duration, timestretch
spork ~ mydrum.playback(6, 10, 0.4); // pattern, length
10::second=> now;

// Ending drum passage
spork ~ mydrum.playback(5, 5, 0.25);
spork ~ myfx.fxPlayback(5, 1.42, 1.5, 0); // int duration, float rate_set, float silent
5::second=> now;
spork ~ mydrum.playback(5, 4, 0.25);
spork ~ myfx.fxPlayback(5, 1.42, 1.5, 0); // int duration, float rate_set, float silent
5::second=> now;
spork ~ mydrum.playback(5, 2, 0.25);
spork ~ myfx.fxPlayback(3, 1.42, 1.5, 1);
3::second=> now;




