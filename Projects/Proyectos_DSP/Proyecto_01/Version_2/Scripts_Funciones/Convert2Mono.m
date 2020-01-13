function Audio_Convert=Convert2Mono(Original_Audio)
[m, n] = size(Original_Audio) %gives dimensions of array where n is the number of stereo channels
if n == 2
    Audio_Convert = Original_Audio(:, 1) + Original_Audio(:, 2); %sum(y, 2) also accomplishes this
    peakAmp = max(abs(Audio_Convert));
    Audio_Convert = Audio_Convert/peakAmp;
    %  check the L/R channels for orig. peak Amplitudes
    peakL = max(abs(Original_Audio(:, 1)));
    peakR = max(abs(Original_Audio(:, 2)));
    maxPeak = max([peakL peakR]);
    %apply x's original peak amplitude to the normalized mono mixdown
    Audio_Convert = Audio_Convert*maxPeak;    
else
    Audio_Convert = Original_Audio; %it is stereo so we will return it as is (e.g., for additional processing)
end


end