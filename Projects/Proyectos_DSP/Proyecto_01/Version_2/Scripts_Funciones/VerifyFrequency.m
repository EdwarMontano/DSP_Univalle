function [DataAudioOne DataAudioTwo]= VerifyFrequency(AudioInOne, AudioInTwo)
            [x1,Fs1] = audioread(AudioInOne);
            [x2,Fs2] = audioread(AudioInTwo);
            if Fs1 ~= Fs2
                ts1=(1/Fs1);
                ts2=(1/Fs2);
                t1=0:ts1:((length(x1)-1)*ts1);    
                t1(end)
                length(t1)
                t2=0:ts2:((length(x2)-1)*ts2);
                t2(end)
                length(t2)
            if Fs1>Fs2
                x_M=interp1(t1,x1,x2, 'spline');
                length(x_M)
                length(t1)
            else
                x_M=interp1(t2,x2,x1, 'spline');
                length(x_M)
                length(t2)
            end
            end           
end