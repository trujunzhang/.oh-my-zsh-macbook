cat video1.avi video2.avi video3.avi video4.avi > output.avi
mencoder -forceidx -oac copy -ovc copy output.avi -o output_final.avi;
rm output.avi