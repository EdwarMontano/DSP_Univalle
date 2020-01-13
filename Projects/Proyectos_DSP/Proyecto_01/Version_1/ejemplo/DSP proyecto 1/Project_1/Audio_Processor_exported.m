classdef Audio_Processor_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        Base                           matlab.ui.Figure
        InputsPanel                    matlab.ui.container.Panel
        TabSignal1                     matlab.ui.container.TabGroup
        AudiofileTab1                  matlab.ui.container.Tab
        Audio1RPlot                    matlab.ui.control.UIAxes
        Audio1LPlot                    matlab.ui.control.UIAxes
        LoadAudio1                     matlab.ui.control.Button
        LocationLabel                  matlab.ui.control.Label
        LocationEditField1             matlab.ui.control.EditField
        Play1Button                    matlab.ui.control.Button
        VolumeSlider_3Label            matlab.ui.control.Label
        VolumeSlider_1                 matlab.ui.control.Slider
        ModeSwitch_1                   matlab.ui.control.Switch
        Button_2                       matlab.ui.control.Button
        SampleRateLabel_2              matlab.ui.control.Label
        ShSampleRate1                  matlab.ui.control.EditField
        RecordTab1                     matlab.ui.container.Tab
        AudioRec1Plot                  matlab.ui.control.UIAxes
        Rec1Button                     matlab.ui.control.Button
        StopRec1Button                 matlab.ui.control.Button
        PlayRec1Button                 matlab.ui.control.Button
        TabSignal2                     matlab.ui.container.TabGroup
        AudiofileTab2                  matlab.ui.container.Tab
        Audio2RPlot                    matlab.ui.control.UIAxes
        Audio2LPlot                    matlab.ui.control.UIAxes
        LoadAudio2                     matlab.ui.control.Button
        LocationEditFieldLabel         matlab.ui.control.Label
        LocationEditField2             matlab.ui.control.EditField
        Play2Button                    matlab.ui.control.Button
        VolumeSliderLabel              matlab.ui.control.Label
        VolumeSlider_2                 matlab.ui.control.Slider
        ModeSwitch_2                   matlab.ui.control.Switch
        Button                         matlab.ui.control.Button
        SampleRateLabel                matlab.ui.control.Label
        ShSampleRate2                  matlab.ui.control.EditField
        RecordMonoTab_2                matlab.ui.container.Tab
        AudioRec2Plot                  matlab.ui.control.UIAxes
        Rec2Button                     matlab.ui.control.Button
        StopRec2Button                 matlab.ui.control.Button
        PlayRec2Button                 matlab.ui.control.Button
        DSPPanel                       matlab.ui.container.Panel
        FIRPanel                       matlab.ui.container.Panel
        ConvolutionfilterhnEditFieldLabel  matlab.ui.control.Label
        ConvolutionfilterEditField     matlab.ui.control.EditField
        IIRPanel                       matlab.ui.container.Panel
        AkEditFieldLabel               matlab.ui.control.Label
        AkEditField                    matlab.ui.control.EditField
        BkEditFieldLabel               matlab.ui.control.Label
        BkEditField                    matlab.ui.control.EditField
        MoreoperationsPanel            matlab.ui.container.Panel
        SumsignalsButton               matlab.ui.control.Button
        SubliminalMessagesButton       matlab.ui.control.Button
        MultiplySignalsButton          matlab.ui.control.Button
        SaveFIRFilterButton            matlab.ui.control.Button
        SaveIIRFilterButton            matlab.ui.control.Button
        ApplyfiltertoDropDownLabel     matlab.ui.control.Label
        ApplyfiltertoDropDown          matlab.ui.control.DropDown
        OperatebetweenDropDownLabel    matlab.ui.control.Label
        OperatebetweenDropDown         matlab.ui.control.DropDown
        InvertDropDownLabel            matlab.ui.control.Label
        InvertDropDown                 matlab.ui.control.DropDown
        StopButton_3                   matlab.ui.control.Button
        PlayinoutputDropDownLabel      matlab.ui.control.Label
        PlayinoutputDropDown           matlab.ui.control.DropDown
        OutputVolumeKnobLabel          matlab.ui.control.Label
        OutputVolumeKnob               matlab.ui.control.Knob
        SelectsamplerateDropDownLabel  matlab.ui.control.Label
        SelectsamplerateDropDown       matlab.ui.control.DropDown
        StatusEditFieldLabel           matlab.ui.control.Label
        StatusEditField                matlab.ui.control.EditField
        PlayButton                     matlab.ui.control.Button
        OutputPanel                    matlab.ui.container.Panel
        AudioOutLPlot                  matlab.ui.control.UIAxes
        AudioOutRPlot                  matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        fs = 16000 %%Initial sample rate
        
        %%Properties associated within recording (1 and 2)%%
        StopRec1 = 0 % Stops and save recording on signal 1
        PauseRec1 = 0% Pauses recording on signal 1
        audiobuff1 % Object that buffs recording
        totalsample1 % Array ready to plot in real time
        
        StopRec2 = 0 % Stops and save recording on signal 2
        PauseRec2 = 0 % Pauses recording on signal 2
        audiobuff2 % Object that buffs recording
        totalsample2 % Array ready to plot in real time
        %************************************************%
        
        nowplayrec1 % Description
        nowplayrec2 % Description
        length1 % Description
        length2 % Description
        audio2play1 % Description
        audio2play2 % Description
        datacompressed1 % Description
        datacompressed2 % Description
        totalsamp1 % Description
        totalsamp2 % Description
        flagstop1 % Description
        flagplay1 % Description
        flagplay2 % Description
        flagstop2 % Description
        volumelevelin1 % Description
        volumelevelin2 % Description
        monostereoin1 % Description
        monostereoin2 % Description
        monostereosw1 % Description
        monostereosw2 % Description
        mix2mono1 % Description
        mix2stereo1 % Description
        mix2mono2 % Description
        mix2stereo2 % Description
        volumeparam1 % Description
        volumeparam2 % Description
        sumaudio1audio2flag = 1 % Description
        sumaudio1rec1flag % Description
        sumaudio1rec2flag % Description
        sumaudio2rec1flag % Description
        sumaudio2rec2flag % Description
        sumrec1rec2flag % Description
        lengthrec1 % Description
        lengthrec2 % Description
        sumdata % Description
        Recdata1 % Description
        Recdata2 % Description
        multdata % Description
        flagstopout % Description
        opdata % Description
        playfilteredflag = 1 % Description
        playoperatedflag % Description
        playinvertedflag % Description
        invertaudio1flag = 1 % Description
        invertaudio2flag % Description
        invertrec1flag % Description
        invertrec2flag % Description
        datainverted % Description
        h % Description
        datafiltered % Description
        filteraudio1flag % Description
        filteraudio2flag % Description
        filterrec1flag % Description
        filterrec2flag % Description
        filterinvflag % Description
        filteropflag % Description
        PlayOutput % Description
        samplesperframe % Description
        flagplayrec1 % Description
        flagplayrec2 % Description
        filterdemoflag = 1 % Description
        NightModeOn = 0 % Description
        PlotA1L % Description
        PlotA1R % Description
        PlotA2L % Description
        PlotA2R % Description
        PlotRec1 % Description
        PlotRec2 % Description
        PlotOL % Description
        PlotOR % Description
    end
    
    methods (Access = private)
        
        
        
        %Funcion para grabar audio a partir de la entrada de microfono
        function nowplayrec = RecAudio(app,SelectRec)
            app.StopRec1 = 0;
            app.StopRec2 = 0;
            if SelectRec == 1
                sh = animatedline(app.AudioRec1Plot,'MaximumNumPoints',800);
            elseif SelectRec == 2
                sh = animatedline(app.AudioRec2Plot,'MaximumNumPoints',800);
            end
            
            audiobuff = audiorecorder(app.fs,16,1);
            totalsample = 0;
            app.samplesperframe = app.fs/10;
            while 1
                
                record(audiobuff);
                pause(0.25);
                stop(audiobuff);
                
                samples=getaudiodata(audiobuff,'double');
                
                totalsample = [totalsample;samples];
                largo=length(totalsample);
                tiempo = 0:(1/app.fs):(largo-1)/app.fs;
                
                if SelectRec == 1
                    addpoints(sh,tiempo,totalsample);
                elseif SelectRec == 2
                    addpoints(sh,tiempo,totalsample);
                end
                
                if app.StopRec1 == 1 || app.StopRec2 == 1
                    break
                end
                ylim(app.AudioRec1Plot,[-1 1]);
                ylim(app.AudioRec2Plot,[-1 1]);
            end
            
            if SelectRec == 1
                app.Recdata1 = totalsample;
                app.lengthrec1 = length(app.Recdata1);
%                 zerosch = zeros(app.lengthrec1,1);
%                 app.Recdata1 = horzcat(app.Recdata1,zerosch);
%                 disp(app.Recdata1)
            elseif SelectRec == 2
                app.Recdata2 = totalsample;
                app.lengthrec2 = length(app.Recdata2);
%                 zerosch = zeros(app.lengthrec2,1);
%                 app.Recdata2 = horzcat(zerosch,app.Recdata2);
%                 disp(app.Recdata2)
            end
            nowplayrec = audioplayer(totalsample,app.fs,16);
            clearpoints(sh);
            app.StopRec1 = 0;
            app.StopRec2 = 0;
        end
        
        
        function datatest = DemoFilters(app)
            t = 0:1/48000:60-(1/48000);
            datatest = chirp(t,10,60,20000,'logarithmic');
            datatest = datatest .* 0.5;
        end
    end
    

    methods (Access = private)

        % Button pushed function: Rec1Button
        function Rec1ButtonPushed(app, event)
            sel = 1;
            app.nowplayrec1 = RecAudio(app,sel);
        end

        % Button pushed function: SubliminalMessagesButton
        function SubliminalMessagesButtonPushed(app, event)
            app.StatusEditField.Value ='Loading...';
            if app.invertaudio1flag == 1
                app.datainverted = flipud(app.datacompressed1);
            elseif app.invertaudio2flag == 1
                app.datainverted = flipud(app.datacompressed2);
            elseif app.invertrec1flag == 1
                app.datainverted = flipud(app.Recdata1);
            elseif app.invertrec2flag == 1
                app.datainverted = flipud(app.Recdata2);
            end
            app.StatusEditField.Value ='Invert done!';
            app.StatusEditField.BackgroundColor = [0.39 0.83 0.07];
        end

        % Callback function
        function Stereo_MonoSwitchValueChanged(app, event)
            %
        end

        % Button pushed function: StopRec1Button
        function StopRec1ButtonPushed(app, event)
            app.StopRec1 = 1;
        end

        % Button pushed function: Play2Button
        function Play2ButtonPushed(app, event)
            
            [~,b] = size(app.datacompressed2);
            if b == 2
                app.flagplay2 = 1;
                app.flagstop2 = 0;
                app.audio2play2 = audioplayer(app.datacompressed2,app.fs);
                cyclebuff = ceil(app.length2/app.samplesperframe);
                left = animatedline(app.Audio2LPlot,'MaximumNumPoints',400);
                right = animatedline(app.Audio2RPlot,'MaximumNumPoints',400);
                play(app.audio2play2);
                for i = 0:cyclebuff-1
                    if i == cyclebuff-1
                        tiempo = (i*0.1):(1/app.fs):(((app.length2/app.samplesperframe)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed2((i*app.samplesperframe)+1:app.length2,1));
                        addpoints(right,tiempo,app.datacompressed2((i*app.samplesperframe)+1:app.length2,2));
                    else
                        tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed2((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                        addpoints(right,tiempo,app.datacompressed2((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,2));
                        
                    end
                    ylim(app.Audio2LPlot,[-1 1]);
                    ylim(app.Audio2RPlot,[-1 1]);
                    pause(0.1);
                    if app.flagstop2 == 1
                        stop(app.audio2play2)
                        break
                    end
                end
                clearpoints(left);
                clearpoints(right);
            
            else
                app.flagplay2 = 1;
                app.flagstop2 = 0;
                app.audio2play2 = audioplayer(app.datacompressed2,app.fs);
                cyclebuff = ceil(app.length2/app.samplesperframe);
                left = animatedline(app.Audio2LPlot,'MaximumNumPoints',400);
                play(app.audio2play2);
                for i = 0:cyclebuff-1
                    if i == cyclebuff-1
                        tiempo = (i*0.1):(1/app.fs):(((app.length2/app.samplesperframe)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed2((i*app.samplesperframe)+1:app.length2,1));
                    else
                        tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed2((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                        
                    end
                    ylim(app.Audio2LPlot,[-1 1]);
                    pause(0.1);
                    if app.flagstop2 == 1
                        stop(app.audio2play2)
                        break
                    end
                end
                clearpoints(left);
            end
            
            app.flagplay2 = 0;
            
        end

        % Button pushed function: Play1Button
        function Play1ButtonPushed(app, event)
            [~,b] = size(app.datacompressed1);
            
            if b == 2
                app.flagstop1 = 0;
                app.flagplay1 = 1;
                app.audio2play1 = audioplayer(app.datacompressed1,app.fs);
                cyclebuff = ceil(app.length1/app.samplesperframe);
                left = animatedline(app.Audio1LPlot,'MaximumNumPoints',400);
                right = animatedline(app.Audio1RPlot,'MaximumNumPoints',400);
                play(app.audio2play1);
                for i = 0:cyclebuff-1
                    
                    if i == cyclebuff-1
                        tiempo = (i*0.1):(1/app.fs):(((app.length1/app.samplesperframe))*0.1-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed1((i*app.samplesperframe)+1:app.length1,1));
                        addpoints(right,tiempo,app.datacompressed1((i*app.samplesperframe)+1:app.length1,2));
                    else
                        tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed1((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                        addpoints(right,tiempo,app.datacompressed1((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,2));
                        
                    end
                    
                    ylim(app.Audio1LPlot,[-1 1]);
                    ylim(app.Audio1RPlot,[-1 1]);
                    pause(0.1);
                    if app.flagstop1 == 1
                        stop(app.audio2play1);
                        break
                    end
                end
                clearpoints(left);
                clearpoints(right);
            
            else
                app.flagstop1 = 0;
                app.flagplay1 = 1;
                app.audio2play1 = audioplayer(app.datacompressed1,app.fs);
                cyclebuff = ceil(app.length1/app.samplesperframe);
                left = animatedline(app.Audio1LPlot,'MaximumNumPoints',400);
                play(app.audio2play1);
                for i = 0:cyclebuff-1
                    
                    if i == cyclebuff-1
                        tiempo = (i*0.1):(1/app.fs):(((app.length1/app.samplesperframe))*0.1-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed1((i*app.samplesperframe)+1:app.length1,1));
                    else
                        tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.datacompressed1((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                        
                    end
                    
                    ylim(app.Audio1LPlot,[-1 1]);
                    pause(0.1);
                    if app.flagstop1 == 1
                        stop(app.audio2play1);
                        break
                    end
                end
                clearpoints(left);
            end
            app.flagplay1 = 0;
        end

        % Button pushed function: SumsignalsButton
        function SumsignalsButtonPushed(app, event)
            app.StatusEditField.Value ='Loading...';
            if app.sumaudio1audio2flag == 1
                data1 = app.datacompressed1;
                data2 = app.datacompressed2;
                %%Sum or concatenate
                if app.monostereoin1 == 1 && app.monostereoin2 == 1
                    if app.length1 < app.length2
                        mzero = zeros(app.length2,1);
                        mzero(1:app.length1) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.length2
                        mzero = zeros(app.length1,1);
                        mzero(1:app.length2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = horzcat(data1,data2);   
                elseif app.monostereoin1 == 1 && app.monostereoin2 == 2
                    monozeros = zeros(app.length1,1);
                    data1 = horzcat(data1,monozeros);
                    
                    if app.length1 < app.length2
                        mzero = zeros(app.length2,2);
                        mzero(1:app.length1,1:2) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.length2
                        mzero = zeros(app.length1,2);
                        mzero(1:app.length2,1:2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = data1 + data2;  
                elseif app.monostereoin1 == 2 && app.monostereoin2 == 1 
                    monozeros = zeros(app.length2,1);
                    data2 = horzcat(data2,monozeros);
                    
                    if app.length1 < app.length2
                        mzero = zeros(app.length2,2);
                        mzero(1:app.length1,1:2) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.length2
                        mzero = zeros(app.length1,2);
                        mzero(1:app.length2,1:2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = data1 + data2; 
                else
                    app.opdata = data1 + data2; 
                end
            elseif app.sumaudio1rec1flag == 1
                data1 = app.datacompressed1;
                data2 = app.Recdata1;
                if app.monostereoin1 == 1
                    if app.length1 < app.lengthrec1
                        mzero = zeros(app.lengthrec1,1);
                        mzero(1:app.length1) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.lengthrec1
                        mzero = zeros(app.length1,1);
                        mzero(1:app.lengthrec1) = data2;
                        data2 = mzero;
                    end
                    app.opdata = horzcat(data1,data2);
                else
                    monozeros = zeros(app.Recdata1,1);
                    data2 = horzcat(data2,monozeros);
                    
                    if app.length1 < app.lengthrec1
                        mzero = zeros(app.lengthrec1,2);
                        mzero(1:app.length1,1:2) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.lengthrec1
                        mzero = zeros(app.length1,2);
                        mzero(1:app.lengthrec1,1:2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = data1 + data2;
                end
            elseif app.sumaudio1rec2flag == 1
                data1 = app.datacompressed1;
                data2 = app.Recdata2;
                if app.monostereoin1 == 1
                    if app.length1 < app.lengthrec2
                        mzero = zeros(app.lengthrec2,1);
                        mzero(1:app.length1) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.lengthrec2
                        mzero = zeros(app.length1,1);
                        mzero(1:app.lengthrec2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = horzcat(data1,data2);
                else
                    monozeros = zeros(app.Recdata2,1);
                    data2 = horzcat(data2,monozeros);
                    if app.length1 < app.lengthrec2
                        mzero = zeros(app.lengthrec2,2);
                        mzero(1:app.length1,1:2) = data1;
                        data1 = mzero;
                    elseif app.length1 > app.lengthrec2
                        mzero = zeros(app.length1,2);
                        mzero(1:app.lengthrec2,1:2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = data1 + data2;
                end
            elseif app.sumaudio2rec1flag == 1
                data1 = app.datacompressed2;
                data2 = app.Recdata1;
                if app.monostereoin2 == 1
                    if app.length2 < app.lengthrec1
                        mzero = zeros(app.lengthrec1,1);
                        mzero(1:app.length2) = data1;
                        data1 = mzero;
                    elseif app.length2 > app.lengthrec1
                        mzero = zeros(app.length2,1);
                        mzero(1:app.lengthrec1) = data2;
                        data2 = mzero;
                    end
                    app.opdata = horzcat(data1,data2);
                else
                    monozeros = zeros(app.Recdata1,1);
                    data2 = horzcat(data2,monozeros);
                    if app.length2 < app.lengthrec1
                        mzero = zeros(app.lengthrec1,2);
                        mzero(1:app.length2,1:2) = data1;
                        data1 = mzero;
                    elseif app.length2 > app.lengthrec1
                        mzero = zeros(app.length2,2);
                        mzero(1:app.lengthrec1,1:2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = data1 + data2;
                end
            elseif app.sumaudio2rec2flag == 1
                data1 = app.datacompressed2;
                data2 = app.Recdata2;
                if app.monostereoin2 == 1
                    if app.length2 < app.lengthrec2
                        mzero = zeros(app.lengthrec2,1);
                        mzero(1:app.length2) = data1;
                        data1 = mzero;
                    elseif app.length2 > app.lengthrec2
                        mzero = zeros(app.length2,1);
                        mzero(1:app.lengthrec2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = horzcat(data1,data2);
                else
                    monozeros = zeros(app.Recdata2,1);
                    data2 = horzcat(data2,monozeros);
                    if app.length2 < app.lengthrec2
                        mzero = zeros(app.lengthrec2,2);
                        mzero(1:app.length2,1:2) = data1;
                        data1 = mzero;
                    elseif app.length2 > app.lengthrec2
                        mzero = zeros(app.length2,2);
                        mzero(1:app.lengthrec2,1:2) = data2;
                        data2 = mzero;
                    end
                    app.opdata = data1 + data2;
                end
                
            elseif app.sumrec1rec2flag == 1
                data1 = app.Recdata1;
                data2 = app.Recdata2;
                if app.lengthrec1 < app.lengthrec2
                    mzero = zeros(app.lengthrec2,1);
                    mzero(1:app.lengthrec1) = data1;
                    data1 = mzero;
                elseif app.lengthrec1 > app.lengthrec2
                    mzero = zeros(app.lengthrec1,1);
                    mzero(1:app.lengthrec2) = data2;
                    data2 = mzero;
                end
                app.opdata = horzcat(data1,data2);
                
            end
            app.StatusEditField.Value ='Addition done!';
            app.StatusEditField.BackgroundColor = [0.39 0.83 0.07];
        end

        % Button pushed function: LoadAudio2
        function LoadAudio2Pushed(app, event)
            [file,path] = uigetfile({'*.mp3;*.flac;*.wav','Audio Files (*.mp3,*.flac,*.wav)'},'Seleccione un archivo de sonido');
            
            if isequal(file,0)
                app.LocationEditField1.Value = 'Load Canceled';
            else
                
                [data,frecuencia] = audioread([path file]);
                infoaudio = audioinfo([path file]);
                app.monostereoin2 = extractfield(infoaudio,'NumChannels');
       
                if app.monostereoin2 == 1
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    app.ModeSwitch_2.Value = 'Mono';
                    if frecuencia == 8000
                        app.ShSampleRate2.Value = '8kHz';
                        if app.fs == 8000
                            datos = data;
                        elseif app.fs == 16000
                            datos(:,1) = interp(data(:,1),2);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),6);
                        elseif app.fs == 48000
                            datos(:,1) = interp(data(:,1),6);
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),12);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 16000
                        app.ShSampleRate2.Value = '16kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),2);
                        elseif app.fs == 16000
                            datos = data;
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),3);
                        elseif app.fs == 48000
                            datos(:,1) = interp(data(:,1),3);
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),6);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 44100
                        app.ShSampleRate2.Value = '44.1kHz';
                        if app.fs == 8000
                            scale = resample(data,160,147);
                            datos(:,1) = decimate(scale(:,1),6);
                        elseif app.fs == 16000
                            scale = resample(data,160,147);
                            datos(:,1) = decimate(scale(:,1),3);
                        elseif app.fs == 44100
                            datos = data;
                        elseif app.fs == 48000
                            datos = resample(data,160,147);
                        elseif app.fs == 96000
                            scale = resample(data,160,147);
                            datos(:,1) = interp(scale(:,1),2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 48000
                        app.ShSampleRate2.Value = '48kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),6);
                        elseif app.fs == 16000
                            datos(:,1) = decimate(data(:,1),3);
                        elseif app.fs == 44100
                            datos = resample(data,147,160);
                        elseif app.fs == 48000
                            datos = data;
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 96000
                        app.ShSampleRate2.Value = '96kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),12);
                        elseif app.fs == 16000
                            datos(:,1) = decimate(data(:,1),6);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),2);
                            
                        elseif app.fs == 48000
                            datos(:,1) = decimate(data(:,1),2);
                        elseif app.fs == 96000
                            datos = data;
                        end
                    end
                elseif app.monostereoin2 == 2
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    app.ModeSwitch_2.Value = 'Stereo';
                    if frecuencia == 8000
                        app.ShSampleRate2.Value = '8kHz';
                        if app.fs == 8000
                            datos = data;
                        elseif app.fs == 16000
                            datos(:,1) = interp(data(:,1),2);
                            datos(:,2) = interp(data(:,2),2);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),6);
                            datos(:,2) = decimate(scale(:,2),6);
                        elseif app.fs == 48000
                            datos(:,1) = interp(data(:,1),6);
                            datos(:,2) = interp(data(:,2),6);
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),12);
                            datos(:,2) = interp(data(:,2),12);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 16000
                        app.ShSampleRate2.Value = '16kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),2);
                            datos(:,2) = decimate(data(:,2),2);
                        elseif app.fs == 16000
                            datos = data;
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),3);
                            datos(:,2) = decimate(scale(:,2),3);
                        elseif app.fs == 48000
                            datos(:,1) = interp(data(:,1),3);
                            datos(:,2) = interp(data(:,2),3);
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),6);
                            datos(:,2) = interp(data(:,2),6);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 44100
                        app.ShSampleRate2.Value = '44.1kHz';
                        if app.fs == 8000
                            scale = resample(data,160,147);
                            datos(:,1) = decimate(scale(:,1),6);
                            datos(:,2) = decimate(scale(:,2),6);
                        elseif app.fs == 16000
                            scale = resample(data,160,147);
                            datos(:,1) = decimate(scale(:,1),3);
                            datos(:,2) = decimate(scale(:,2),3);
                        elseif app.fs == 44100
                            datos = data;
                        elseif app.fs == 48000
                            datos = resample(data,160,147);
                        elseif app.fs == 96000
                            scale = resample(data,160,147);
                            datos(:,1) = interp(scale(:,1),2);
                            datos(:,2) = interp(scale(:,2),2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 48000
                        app.ShSampleRate2.Value = '48kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),6);
                            datos(:,2) = decimate(data(:,2),6);
                        elseif app.fs == 16000
                            datos(:,1) = decimate(data(:,1),3);
                            datos(:,2) = decimate(data(:,2),3);
                        elseif app.fs == 44100
                            datos = resample(data,147,160);
                        elseif app.fs == 48000
                            datos = data;
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),2);
                            datos(:,2) = interp(data(:,2),2);
                        end
                    
                        %___________________________________________________________________________%
                    elseif frecuencia == 96000
                        app.ShSampleRate2.Value = '96kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),12);
                            datos(:,2) = decimate(data(:,2),12);
                        elseif app.fs == 16000
                            datos(:,1) = decimate(data(:,1),6);
                            datos(:,2) = decimate(data(:,2),6);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),2);
                            datos(:,2) = decimate(scale(:,2),2);
                            
                        elseif app.fs == 48000
                            datos(:,1) = decimate(data(:,1),2);
                            datos(:,2) = decimate(data(:,2),2);
                        elseif app.fs == 96000
                            datos = data;
                        end
                    end
                end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
                    
                app.datacompressed2 = datos;
                app.length2 = length(datos);
                    
                app.samplesperframe = app.fs/10;
                app.LocationEditField2.Value =[path file];
            end
        end

        % Button pushed function: LoadAudio1
        function LoadAudio1Pushed(app, event)
                
            [file,path] = uigetfile({'*.mp3;*.flac;*.wav','Audio Files (*.mp3,*.flac,*.wav)'},'Seleccione un archivo de sonido');
                
            if isequal(file,0)
                app.LocationEditField2.Value = 'Load Canceled';
            else
                [data,frecuencia] = audioread([path file]);
                infoaudio = audioinfo([path file]);
                app.monostereoin1 = extractfield(infoaudio,'NumChannels');
                
              
%                 app.ShSampleRate1.Value = frecuencia;
                
                if app.monostereoin1 == 1
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    app.ModeSwitch_1.Value = 'Mono';
                    if frecuencia == 8000
                        app.ShSampleRate1.Value = '8kHz';
                        if app.fs == 8000
                            datos = data;
                        elseif app.fs == 16000
                            datos = interp(data,2);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos = decimate(scale,6);
                        elseif app.fs == 48000
                            datos = interp(data,6);
                        elseif app.fs == 96000
                            datos = interp(data,12);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 16000
                        app.ShSampleRate1.Value = '16kHz';
                        if app.fs == 8000
                            datos = decimate(data,2);
                        elseif app.fs == 16000
                            datos = data;
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos = decimate(scale,3);
                        elseif app.fs == 48000
                            datos = interp(data,3);
                        elseif app.fs == 96000
                            datos = interp(data,6);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 44100
                        app.ShSampleRate1.Value = '44.1kHz';
                        if app.fs == 8000
                            scale = resample(data,160,147);
                            datos = decimate(scale,6);
                        elseif app.fs == 16000
                            scale = resample(data,160,147);
                            datos = decimate(scale,3);
                        elseif app.fs == 44100
                            datos = data;
                        elseif app.fs == 48000
                            datos = resample(data,160,147);
                        elseif app.fs == 96000
                            scale = resample(data,160,147);
                            datos = interp(scale,2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 48000
                        app.ShSampleRate1.Value = '48kHz';
                        if app.fs == 8000
                            datos = decimate(data,6);
                        elseif app.fs == 16000
                            datos = decimate(data,3);
                        elseif app.fs == 44100
                            datos = resample(data,147,160);
                        elseif app.fs == 48000
                            datos = data;
                        elseif app.fs == 96000
                            datos = interp(data,2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 96000
                        app.ShSampleRate1.Value = '96kHz';
                        if app.fs == 8000
                            datos = decimate(data,12);
                        elseif app.fs == 16000
                            datos = decimate(data,6);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos = decimate(scale,2);
                        elseif app.fs == 48000
                            datos = decimate(data,2);
                        elseif app.fs == 96000
                            datos = data;
                        end
                    end
                elseif app.monostereoin1 == 2
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    app.ModeSwitch_1.Value = 'Stereo';
                    if frecuencia == 8000
                        app.ShSampleRate1.Value = '8kHz';
                        if app.fs == 8000
                            datos = data;
                        elseif app.fs == 16000
                            datos(:,1) = interp(data(:,1),2);
                            datos(:,2) = interp(data(:,2),2);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),6);
                            datos(:,2) = decimate(scale(:,2),6);
                        elseif app.fs == 48000
                            datos(:,1) = interp(data(:,1),6);
                            datos(:,2) = interp(data(:,2),6);
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),12);
                            datos(:,2) = interp(data(:,2),12);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 16000
                        app.ShSampleRate1.Value = '16kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),2);
                            datos(:,2) = decimate(data(:,2),2);
                        elseif app.fs == 16000
                            datos = data;
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),3);
                            datos(:,2) = decimate(scale(:,2),3);
                        elseif app.fs == 48000
                            datos(:,1) = interp(data(:,1),3);
                            datos(:,2) = interp(data(:,2),3);
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),6);
                            datos(:,2) = interp(data(:,2),6);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 44100
                        app.ShSampleRate1.Value = '44.1kHz';
                        if app.fs == 8000
                            scale = resample(data,160,147);
                            datos(:,1) = decimate(scale(:,1),6);
                            datos(:,2) = decimate(scale(:,2),6);
                        elseif app.fs == 16000
                            scale = resample(data,160,147);
                            datos(:,1) = decimate(scale(:,1),3);
                            datos(:,2) = decimate(scale(:,2),3);
                        elseif app.fs == 44100
                            datos = data;
                        elseif app.fs == 48000
                            datos = resample(data,160,147);
                        elseif app.fs == 96000
                            scale = resample(data,160,147);
                            datos(:,1) = interp(scale(:,1),2);
                            datos(:,2) = interp(scale(:,2),2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 48000
                        app.ShSampleRate1.Value = '48kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),6);
                            datos(:,2) = decimate(data(:,2),6);
                        elseif app.fs == 16000
                            datos(:,1) = decimate(data(:,1),3);
                            datos(:,2) = decimate(data(:,2),3);
                        elseif app.fs == 44100
                            datos = resample(data,147,160);
                        elseif app.fs == 48000
                            datos = data;
                        elseif app.fs == 96000
                            datos(:,1) = interp(data(:,1),2);
                            datos(:,2) = interp(data(:,2),2);
                        end
                        %___________________________________________________________________________%
                    elseif frecuencia == 96000
                        app.ShSampleRate1.Value = '96kHz';
                        if app.fs == 8000
                            datos(:,1) = decimate(data(:,1),12);
                            datos(:,2) = decimate(data(:,2),12);
                        elseif app.fs == 16000
                            datos(:,1) = decimate(data(:,1),6);
                            datos(:,2) = decimate(data(:,2),6);
                        elseif app.fs == 44100
                            scale = resample(data,147,160);
                            datos(:,1) = decimate(scale(:,1),2);
                            datos(:,2) = decimate(scale(:,2),2);
                            
                        elseif app.fs == 48000
                            datos(:,1) = decimate(data(:,1),2);
                            datos(:,2) = decimate(data(:,2),2);
                        elseif app.fs == 96000
                            datos = data;
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                end
                
                app.datacompressed1 = datos;
                app.length1 = length(datos);
                
                app.samplesperframe = app.fs/10;
                app.LocationEditField1.Value =[path file];
            end
        end

        % Button pushed function: Rec2Button
        function Rec2ButtonPushed(app, event)
            sel = 2;
            app.nowplayrec2 = RecAudio(app,sel);
        end

        % Button pushed function: StopRec2Button
        function StopRec2ButtonPushed(app, event)
            app.StopRec2 = 1;
        end

        % Button pushed function: PlayRec2Button
        function PlayRec2ButtonPushed(app, event)
            app.samplesperframe = app.fs/10;
            app.StopRec2 = 0;
            app.flagplayrec2 = 1;
            cyclebuff = ceil(app.lengthrec2/app.samplesperframe);
            left = animatedline(app.AudioRec2Plot,'MaximumNumPoints',400);
            play(app.nowplayrec2);
            for i = 0:cyclebuff-1
                
                if i == cyclebuff-1
                    tiempo = (i*0.1):(1/app.fs):(((app.lengthrec2/app.samplesperframe))*0.1-(1/app.fs));
                    addpoints(left,tiempo,app.Recdata2((i*app.samplesperframe)+1:app.lengthrec2,1));
                else
                    tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                    addpoints(left,tiempo,app.Recdata2((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                end
                
                ylim(app.AudioRec2Plot,[-1 1]);
                pause(0.1);
                if app.StopRec2 == 1
                    stop(app.nowplayrec2);
                    break
                end
            end
            clearpoints(left);
            app.flagplayrec2 = 0;
        end

        % Button pushed function: PlayRec1Button
        function PlayRec1ButtonPushed(app, event)
            
            app.samplesperframe = app.fs/10;
            app.StopRec1 = 0;
            app.flagplayrec1 = 1;
            cyclebuff = ceil(app.lengthrec1/app.samplesperframe);
            left = animatedline(app.AudioRec1Plot,'MaximumNumPoints',400);
            play(app.nowplayrec1);
            for i = 0:cyclebuff-1
                
                if i == cyclebuff-1
                    tiempo = (i*0.1):(1/app.fs):(((app.lengthrec1/app.samplesperframe))*0.1-(1/app.fs));
                    addpoints(left,tiempo,app.Recdata1((i*app.samplesperframe)+1:app.lengthrec1,1));
                else
                    tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                    addpoints(left,tiempo,app.Recdata1((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                end
                
                ylim(app.AudioRec1Plot,[-1 1]);
                pause(0.1);
                if app.StopRec1 == 1
                    stop(app.nowplayrec1);
                    break
                end
            end
            clearpoints(left);
            app.flagplayrec1 = 0;
        end

        % Value changed function: OutputVolumeKnob
        function OutputVolumeKnobValueChanged(app, event)
            value = app.OutputVolumeKnob.Value;
            if app.playfilteredflag == 1
                if value == 100
                    app.datafiltered = app.datafiltered*log(100/(100-99.5));
                else
                    app.datafiltered = app.datafiltered*log(100/(100-value));
                end
            elseif app.playoperatedflag == 1
                if value == 100
                    app.opdata = app.opdata*log(100/(100-99.5));
                else
                    app.opdata = app.opdata*log(100/(100-value));
                end
                
            elseif app.playinvertedflag == 1
                if value == 100
                    app.datainverted = app.datainverted*log(100/(100-99.5));
                else
                    app.datainverted = app.datainverted*log(100/(100-value));
                end
            end
        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
            app.flagstop1 = 1;
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            app.flagstop2 = 1;
        end

        % Value changed function: VolumeSlider_2
        function VolumeSlider_2ValueChanged(app, event)
            app.volumelevelin2 = app.VolumeSlider_2.Value;
            if app.volumelevelin2 == 100
                app.datacompressed2 = app.datacompressed2*log(100/(100-99.5));
            else
                app.datacompressed2 = app.datacompressed2*log(100/(100-app.volumelevelin2));
            end
        end

        % Value changed function: VolumeSlider_1
        function VolumeSlider_1ValueChanged(app, event)
            app.volumelevelin1 = app.VolumeSlider_1.Value;
            if app.volumelevelin1 == 100
                app.datacompressed1 = app.datacompressed1*log(100/(100-99.5));
            else
                app.datacompressed1 = app.datacompressed1*log(100/(100-app.volumelevelin1));
            end
        end

        % Value changed function: ModeSwitch_2
        function ModeSwitch_2ValueChanged(app, event)
            app.monostereosw2 = app.ModeSwitch_2.Value;
            if app.monostereoin2 == 2
                if strcmp(app.monostereosw2,'Mono')
                    side = ((app.datacompressed2(:,1)/2)+(app.datacompressed2(:,2))/2);
                    app.datacompressed2 = side;
                    app.monostereoin2 = 1;
                end
            elseif app.monostereoin2 == 1
                if strcmp(app.monostereosw2,'Stereo')
                    app.datacompressed2 = repmat(app.datacompressed2,1,2);
                    app.monostereoin2 = 2;
                end
            end
        end

        % Value changed function: ModeSwitch_1
        function ModeSwitch_1ValueChanged(app, event)
            app.monostereosw1 = app.ModeSwitch_1.Value;
            if app.monostereoin1 == 2
                if strcmp(app.monostereosw1,'Mono')
                    side = ((app.datacompressed1(:,1)/2)+(app.datacompressed1(:,2))/2);
                    app.datacompressed1 = side;
                    app.monostereoin1 = 1;
                end
            elseif app.monostereoin1 == 1
                if strcmp(app.monostereosw1,'Stereo')
                    app.datacompressed1 = repmat(app.datacompressed1,1,2);
                    app.monostereroin1 = 2;
                end
            end
        end

        % Value changed function: OperatebetweenDropDown
        function OperatebetweenDropDownValueChanged(app, event)
            value = app.OperatebetweenDropDown.Value;
            if strcmp(value,'Audio 1 + Audio 2')
                app.sumaudio1audio2flag = 1;
                app.sumaudio1rec1flag = 0;
                app.sumaudio1rec2flag = 0;
                app.sumaudio2rec1flag = 0;
                app.sumaudio2rec2flag = 0;
                app.sumrec1rec2flag = 0;
            elseif strcmp(value,'Audio 1 + Rec 1')
                app.sumaudio1audio2flag = 0;
                app.sumaudio1rec1flag = 1;
                app.sumaudio1rec2flag = 0;
                app.sumaudio2rec1flag = 0;
                app.sumaudio2rec2flag = 0;
                app.sumrec1rec2flag = 0;
            elseif strcmp(value,'Audio 1 + Rec 2')
                app.sumaudio1audio2flag = 0;
                app.sumaudio1rec1flag = 0;
                app.sumaudio1rec2flag = 1;
                app.sumaudio2rec1flag = 0;
                app.sumaudio2rec2flag = 0;
                app.sumrec1rec2flag = 0;
            elseif strcmp(value,'Audio 2 + Rec 1')
                app.sumaudio1audio2flag = 0;
                app.sumaudio1rec1flag = 0;
                app.sumaudio1rec2flag = 0;
                app.sumaudio2rec1flag = 1;
                app.sumaudio2rec2flag = 0;
                app.sumrec1rec2flag = 0;
            elseif strcmp(value,'Audio 2 + Rec 2')
                app.sumaudio1audio2flag = 0;
                app.sumaudio1rec1flag = 0;
                app.sumaudio1rec2flag = 0;
                app.sumaudio2rec1flag = 0;
                app.sumaudio2rec2flag = 1;
                app.sumrec1rec2flag = 0;
            elseif strcmp(value,'Rec 1 + Rec 2')
                app.sumaudio1audio2flag = 0;
                app.sumaudio1rec1flag = 0;
                app.sumaudio1rec2flag = 0;
                app.sumaudio2rec1flag = 0;
                app.sumaudio2rec2flag = 0;
                app.sumrec1rec2flag = 1;
            end
        end

        % Button pushed function: MultiplySignalsButton
        function MultiplySignalsButtonPushed(app, event)
            app.StatusEditField.Value ='Loading...';
            if app.sumaudio1audio2flag == 1
                data1 = app.datacompressed1;
                data2 = app.datacompressed2;
                if app.length1 < app.length2
                    mzero = zeros(app.length2,2);
                    mzero(1:app.length1,1:2) = data1;
                    data1 = mzero;
                elseif app.length1 > app.length2
                    mzero = zeros(app.length1,2);
                    mzero(1:app.length2,1:2) = data2;
                    data2 = mzero;
                end
                app.opdata = data1.*data2;
            elseif app.sumaudio1rec1flag == 1
                data1 = app.datacompressed1;
                data2 = repmat(app.Recdata1,1,2);
                if app.length1 < app.lengthrec1
                    mzero = zeros(app.lengthrec1,2);
                    mzero(1:app.length1,1:2) = data1;
                    data1 = mzero;
                elseif app.length1 > app.lengthrec1
                    mzero = zeros(app.length1,2);
                    mzero(1:app.lengthrec1,1:2) = data2;
                    data2 = mzero;
                end
                app.opdata = data1.*data2;
            elseif app.sumaudio1rec2flag == 1
                data1 = app.datacompressed1;
                data2 = repmat(app.Recdata2,1,2);
                if app.length1 < app.lengthrec2
                    mzero = zeros(app.lengthrec2,2);
                    mzero(1:app.length1,1:2) = data1;
                    data1 = mzero;
                elseif app.length1 > app.lengthrec2
                    mzero = zeros(app.length1,2);
                    mzero(1:app.lengthrec2,1:2) = data2;
                    data2 = mzero;
                end
                app.opdata = data1.*data2;
            elseif app.sumaudio2rec1flag == 1
                data1 = app.datacompressed2;
                data2 = repmat(app.Recdata1,1,2);
                if app.length2 < app.lengthrec1
                    mzero = zeros(app.lengthrec1,2);
                    mzero(1:app.length2,1:2) = data1;
                    data1 = mzero;
                elseif app.length2 > app.lengthrec1
                    mzero = zeros(app.length2,2);
                    mzero(1:app.lengthrec1,1:2) = data2;
                    data2 = mzero;
                end
                app.opdata = data1.*data2;
            elseif app.sumaudio2rec2flag == 1
                data1 = app.datacompressed2;
                data2 = repmat(app.Recdata2,1,2);
                if app.length2 < app.lengthrec2
                    mzero = zeros(app.lengthrec2,2);
                    mzero(1:app.length2,1:2) = data1;
                    data1 = mzero;
                elseif app.length2 > app.lengthrec2
                    mzero = zeros(app.length2,2);
                    mzero(1:app.lengthrec2,1:2) = data2;
                    data2 = mzero;
                end
                app.opdata = data1.*data2;
            elseif app.sumrec1rec2flag == 1
                data1 = repmat(app.Recdata1,1,2);
                data2 = repmat(app.Recdata2,1,2);
                if app.lengthrec1 < app.lengthrec2
                    mzero = zeros(app.lengthrec2,2);
                    mzero(1:app.lengthrec1,1:2) = data1;
                    data1 = mzero;
                elseif app.lengthrec1 > app.lengthrec2
                    mzero = zeros(app.lengthrec1,2);
                    mzero(1:app.lengthrec2,1:2) = data2;
                    data2 = mzero;
                end
                app.opdata = data1.*data2;
                app.StatusEditField.Value ='Multiply done!';
                app.StatusEditField.BackgroundColor = [0.39 0.83 0.07];
            end
        end

        % Button pushed function: StopButton_3
        function StopButton_3Pushed(app, event)
            app.flagstopout = 1;
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            app.StatusEditField.Value ='Playing...';
            app.StatusEditField.BackgroundColor = [0.30 0.95 0.73];
            %%Reproducir señal filtrada
            if app.playfilteredflag == 1
                app.PlayOutput = app.datafiltered;
                %%reproducir señal operada
            elseif app.playoperatedflag == 1
                app.PlayOutput = app.opdata;
                %%Reproducir entrada invertida
            elseif app.playinvertedflag == 1
                app.PlayOutput = app.datainverted;
            end
            app.samplesperframe = app.fs/10;
            [~,b] = size(app.PlayOutput);
            
            if b == 2
                app.flagstopout = 0;
                playout = audioplayer(app.PlayOutput,app.fs);
                outlength = length(app.PlayOutput);
                cyclebuff = ceil(outlength/app.samplesperframe);
                left = animatedline(app.AudioOutLPlot,'MaximumNumPoints',400);
                right = animatedline(app.AudioOutRPlot,'MaximumNumPoints',400);
                play(playout);
                for i = 0:cyclebuff-1
                    if i == cyclebuff-1
                        tiempo = (i*0.1):(1/app.fs):(((outlength/app.samplesperframe)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.PlayOutput((i*app.samplesperframe)+1:outlength,1));
                        addpoints(right,tiempo,app.PlayOutput((i*app.samplesperframe)+1:outlength,2));
                    else
                        tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.PlayOutput((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                        addpoints(right,tiempo,app.PlayOutput((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,2));
                        
                    end
                    ylim(app.AudioOutLPlot,[-1 1]);
                    ylim(app.AudioOutRPlot,[-1 1]);
                    pause(0.1);
                    if app.flagstopout == 1
                        stop(playout)
                        break
                    end
                end
                clearpoints(left);
                clearpoints(right);
                
            else
                app.flagstopout = 0;
                playout = audioplayer(app.PlayOutput,app.fs);
                outlength = length(app.PlayOutput);
                cyclebuff = ceil(outlength/app.samplesperframe);
                left = animatedline(app.AudioOutLPlot,'MaximumNumPoints',400);
                right = animatedline(app.AudioOutRPlot,'MaximumNumPoints',400);
                play(playout);
                for i = 0:cyclebuff-1
                    if i == cyclebuff-1
                        tiempo = (i*0.1):(1/app.fs):(((outlength/app.samplesperframe)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.PlayOutput((i*app.samplesperframe)+1:outlength,1));
                    else
                        tiempo = (i*0.1):(1/app.fs):(((i+1)*0.1)-(1/app.fs));
                        addpoints(left,tiempo,app.PlayOutput((i*app.samplesperframe)+1:(i+1)*app.samplesperframe,1));
                        
                    end
                    ylim(app.AudioOutLPlot,[-1 1]);
                    pause(0.1);
                    if app.flagstopout == 1
                        stop(playout)
                        break
                    end
                end
                clearpoints(left);
                clearpoints(right);
            end
            app.StatusEditField.Value ='Stopped';
            app.StatusEditField.BackgroundColor = [0.86 0.27 0.27];
        end

        % Value changed function: PlayinoutputDropDown
        function PlayinoutputDropDownValueChanged(app, event)
            value = app.PlayinoutputDropDown.Value;
            if strcmp(value,'Inverted')
                app.playoperatedflag = 0;
                app.playfilteredflag = 0;
                app.playinvertedflag = 1;
            elseif strcmp(value,'Operated')
                app.playoperatedflag = 1;
                app.playfilteredflag = 0;
                app.playinvertedflag = 0;
            elseif strcmp(value,'Filtered')
                app.playoperatedflag = 0;
                app.playfilteredflag = 1;
                app.playinvertedflag = 0;
            end
        end

        % Value changed function: InvertDropDown
        function InvertDropDownValueChanged(app, event)
            value = app.InvertDropDown.Value;
            if strcmp(value,'Audio 1')
                app.invertaudio1flag = 1;
                app.invertaudio2flag = 0;
                app.invertrec1flag = 0;
                app.invertrec2flag = 0;
            elseif strcmp(value,'Audio 2')
                app.invertaudio1flag = 0;
                app.invertaudio2flag = 1;
                app.invertrec1flag = 0;
                app.invertrec2flag = 0;
            elseif strcmp(value,'Rec 1')
                app.invertaudio1flag = 0;
                app.invertaudio2flag = 0;
                app.invertrec1flag = 1;
                app.invertrec2flag = 0;
            elseif strcmp(value,'Rec 2')
                app.invertaudio1flag = 0;
                app.invertaudio2flag = 0;
                app.invertrec1flag = 0;
                app.invertrec2flag = 1;
            end
        end

        % Button pushed function: SaveFIRFilterButton
        function SaveFIRFilterButtonPushed(app, event)
            app.StatusEditField.Value ='Loading...';
            hp=app.ConvolutionfilterEditField.Value;
            app.h=str2num(hp);
            
            if app.filteraudio1flag == 1
                data2filter = app.datacompressed1;
            elseif app.filteraudio2flag == 1
                data2filter = app.datacompressed2;
            elseif app.filterrec1flag == 1
                data2filter = app.Recdata1;
            elseif app.filterrec2flag == 1
                data2filter = app.Recdata2;
            elseif app.filteropflag == 1
                data2filter = app.opdata;
            elseif app.filterinvflag == 1
                data2filter = app.datainverted;
            elseif app.filterdemoflag == 1
                data2filter = DemoFilters(app);
            end
            
            [~,b] = size(data2filter);
            
            if b == 2
                largo=length(data2filter);
                largo1=length(app.h);
                filtrado=zeros(largo,2);
                
                for i=1:(largo)
                    htotal=0;
                    for j=1:largo1
                        
                        if i >= (largo1+1) && (largo) >= i
                            hacumulada=app.h(j)*data2filter((i-j),1);
                            htotal=htotal+hacumulada;
                        end
                    end
                    filtrado(i,1)=htotal;
                    htotal1=0;
                    for j=1:largo1
                        
                        if i >= (largo1+1) && (largo) >= i
                            hacumulada=app.h(j)*data2filter((i-j),2);
                            htotal1=htotal1+hacumulada;
                        end
                        
                    end
                    filtrado(i,2)=htotal1;
                end
                
            else
                largo=length(data2filter);
                largo1=length(app.h);
                filtrado=zeros(largo,1);
                
                for i=1:(largo)
                    htotal=0;
                    for j=1:largo1
                        
                        if i >= (largo1+1) && (largo) >= i
                            hacumulada=app.h(j)*data2filter((i-j));
                            htotal=htotal+hacumulada;
                        end
                    end
                    filtrado(i)=htotal;
                end
            end
            
            
            app.datafiltered = filtrado;
            app.StatusEditField.Value ='Filter FIR done!';
            app.StatusEditField.BackgroundColor = [0.39 0.83 0.07];
        end

        % Value changed function: ApplyfiltertoDropDown
        function ApplyfiltertoDropDownValueChanged(app, event)
            value = app.ApplyfiltertoDropDown.Value;
            if strcmp(value,'Audio 1')
                app.filteraudio1flag = 1;
                app.filteraudio2flag = 0;
                app.filterrec1flag = 0;
                app.filterrec2flag = 0;
                app.filteropflag = 0;
                app.filterinvflag = 0;
                app.filterdemoflag = 0;
            elseif strcmp(value,'Audio 2')
                app.filteraudio1flag = 0;
                app.filteraudio2flag = 1;
                app.filterrec1flag = 0;
                app.filterrec2flag = 0;
                app.filteropflag = 0;
                app.filterinvflag = 0;
                app.filterdemoflag = 0;
            elseif strcmp(value,'Rec 1')
                app.filteraudio1flag = 0;
                app.filteraudio2flag = 0;
                app.filterrec1flag = 1;
                app.filterrec2flag = 0;
                app.filteropflag = 0;
                app.filterinvflag = 0;
                app.filterdemoflag = 0;
            elseif strcmp(value,'Rec 2')
                app.filteraudio1flag = 0;
                app.filteraudio2flag = 0;
                app.filterrec1flag = 0;
                app.filterrec2flag = 1;
                app.filteroplag = 0;
                app.filterinvflag = 0;
                app.filterdemoflag = 0;
            elseif strcmp(value,'Operation')
                app.filteraudio1flag = 0;
                app.filteraudio2flag = 0;
                app.filterrec1flag = 0;
                app.filterrec2flag = 0;
                app.filteropflag = 1;
                app.filterinvflag = 0;
                app.filterdemoflag = 0;
            elseif strcmp(value,'Inverted')
                app.filteraudio1flag = 0;
                app.filteraudio2flag = 0;
                app.filterrec1flag = 0;
                app.filterrec2flag = 0;
                app.filteropflag = 0;
                app.filterinvflag = 1;
                app.filterdemoflag = 0;
            elseif strcmp(value,'Demo')
                app.filteraudio1flag = 0;
                app.filteraudio2flag = 0;
                app.filterrec1flag = 0;
                app.filterrec2flag = 0;
                app.filteropflag = 0;
                app.filterinvflag = 0;
                app.filterdemoflag = 1;
            end
        end

        % Button pushed function: SaveIIRFilterButton
        function SaveIIRFilterButtonPushed(app, event)
            app.StatusEditField.Value ='Loading...';
            ak=str2num(app.AkEditField.Value);
            bk=str2num(app.BkEditField.Value);
            
            if app.filteraudio1flag == 1
                data2filter = app.datacompressed1;
            elseif app.filteraudio2flag == 1
                data2filter = app.datacompressed2;
            elseif app.filterrec1flag == 1
                data2filter = app.Recdata1;
            elseif app.filterrec2flag == 1
                data2filter = app.Recdata2;
            elseif app.filteropflag == 1
                data2filter = app.opdata;
            elseif app.filterinvflag == 1
                data2filter = app.datainverted;
            elseif app.filterdemoflag == 1
                data2filter = DemoFilters(app);
            end
            
            [~,b] = size(data2filter);
            
            if b == 2
                largo = length(data2filter);
                largo1 = length(ak);
                largo2 = length(bk);
                filtrado = zeros(largo,2);
                disp(ak)
                disp(bk)
                
                for i=1:(largo)
                    ha1total=0;
                    hb1total=0;
                    ha2total=0;
                    hb2total=0;
                    
                    
                    for j=1:largo1
                        
                        if i >= (largo1+1) && (largo) >= i && j>1
                            haacumulada=filtrado((i-j),1)*(ak(j)/ak(1));
                            ha1total=ha1total+haacumulada;
                        end
                    end
                    
                    
                    for j=1:largo2
                        
                        if i >= (largo2+1) && (largo) >= i
                            hbacumulada=data2filter((i-j),1)*(bk(j)/ak(1));
                            hb1total=hb1total+hbacumulada;
                        end
                        
                    end
                    filtrado(i,1)=hb1total-ha1total;
                    
                    
                    for j=1:largo1
                        
                        if i >= (largo1+1) && (largo) >= i && j>1
                            haacumulada=filtrado((i-j),2)*(ak(j)/ak(1));
                            ha2total=ha2total+haacumulada;
                        end
                    end
                    
                    
                    for j=1:largo2
                        
                        if i >= (largo2+1) && (largo) >= i
                            hbacumulada=data2filter((i-j),2)*(bk(j)/ak(1));
                            hb2total=hb2total+hbacumulada;
                        end
                        
                    end
                    
                    
                    filtrado(i,2)=hb2total-ha2total;
                end
                
                
            else
                largo = length(data2filter);
                largo1 = length(ak);
                largo2 = length(bk);
                filtrado = zeros(largo,1);
                disp(ak)
                disp(bk)
                
                for i=1:(largo)
                    ha1total=0;
                    hb1total=0;
                    
                    for j=1:largo1
                        
                        if i >= (largo1+1) && (largo) >= i && j>1
                            haacumulada=filtrado((i-j))*(ak(j)/ak(1));
                            ha1total=ha1total-haacumulada;
                        end
                    end
                    
                    
                    for j=1:largo2
                        
                        if i >= (largo2+1) && (largo) >= i
                            hbacumulada=data2filter((i-j))*(bk(j)/ak(1));
                            hb1total=hb1total-hbacumulada;
                        end
                        
                    end
                    filtrado(i)=hb1total-ha1total;
                end
                
            end
            
            app.datafiltered = filtrado;
            app.StatusEditField.Value ='Filter IIR done!';
            app.StatusEditField.BackgroundColor = [0.39 0.83 0.07];
        end

        % Value changed function: SelectsamplerateDropDown
        function SelectsamplerateDropDownValueChanged(app, event)
            
            value = app.SelectsamplerateDropDown.Value;
            if strcmp(value,'8kHz')
                app.fs = 8000;
                app.StatusEditField.Value ='Sample Rate = 8kHz';
            elseif strcmp(value,'16kHz')
                app.fs = 16000;
                app.StatusEditField.Value ='Sample Rate = 16kHz';
            elseif strcmp(value,'44.1kHz')
                app.fs = 44100;
                app.StatusEditField.Value ='Sample Rate = 44.1kHz';
            elseif strcmp(value,'48kHz')
                app.fs = 48000;
                app.StatusEditField.Value ='Sample Rate = 48kHz';
            elseif strcmp(value,'96kHz')
                app.fs = 96000;
                app.StatusEditField.Value ='Sample Rate = 96kHz';
            end
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create Base
            app.Base = uifigure;
            app.Base.Color = [0.9412 0.9412 0.9412];
            app.Base.Position = [0 0 1900 1060];
            app.Base.Name = 'UI Figure';
            app.Base.Scrollable = 'on';

            % Create InputsPanel
            app.InputsPanel = uipanel(app.Base);
            app.InputsPanel.Title = 'Inputs';
            app.InputsPanel.FontWeight = 'bold';
            app.InputsPanel.Position = [10 490 1880 560];

            % Create TabSignal1
            app.TabSignal1 = uitabgroup(app.InputsPanel);
            app.TabSignal1.Position = [11 9 920 520];

            % Create AudiofileTab1
            app.AudiofileTab1 = uitab(app.TabSignal1);
            app.AudiofileTab1.Title = 'Audio file (Mono/Stereo)';

            % Create Audio1RPlot
            app.Audio1RPlot = uiaxes(app.AudiofileTab1);
            title(app.Audio1RPlot, 'Right Channel')
            xlabel(app.Audio1RPlot, 't [s]')
            ylabel(app.Audio1RPlot, 'Amplitude')
            app.Audio1RPlot.GridAlpha = 0.4;
            app.Audio1RPlot.MinorGridAlpha = 0.5;
            app.Audio1RPlot.Box = 'on';
            app.Audio1RPlot.XMinorTick = 'on';
            app.Audio1RPlot.YMinorTick = 'on';
            app.Audio1RPlot.XGrid = 'on';
            app.Audio1RPlot.XMinorGrid = 'on';
            app.Audio1RPlot.YGrid = 'on';
            app.Audio1RPlot.YMinorGrid = 'on';
            app.Audio1RPlot.Position = [10 10 900 200];

            % Create Audio1LPlot
            app.Audio1LPlot = uiaxes(app.AudiofileTab1);
            title(app.Audio1LPlot, 'Left Channel')
            xlabel(app.Audio1LPlot, 't [s]')
            ylabel(app.Audio1LPlot, 'Amplitude')
            app.Audio1LPlot.GridAlpha = 0.4;
            app.Audio1LPlot.MinorGridAlpha = 0.5;
            app.Audio1LPlot.Box = 'on';
            app.Audio1LPlot.XMinorTick = 'on';
            app.Audio1LPlot.YMinorTick = 'on';
            app.Audio1LPlot.XGrid = 'on';
            app.Audio1LPlot.XMinorGrid = 'on';
            app.Audio1LPlot.YGrid = 'on';
            app.Audio1LPlot.YMinorGrid = 'on';
            app.Audio1LPlot.Position = [10 215 900 200];

            % Create LoadAudio1
            app.LoadAudio1 = uibutton(app.AudiofileTab1, 'push');
            app.LoadAudio1.ButtonPushedFcn = createCallbackFcn(app, @LoadAudio1Pushed, true);
            app.LoadAudio1.Icon = 'icons8-musical-80.png';
            app.LoadAudio1.BackgroundColor = [1 1 1];
            app.LoadAudio1.Position = [52 402 80 80];
            app.LoadAudio1.Text = '';

            % Create LocationLabel
            app.LocationLabel = uilabel(app.AudiofileTab1);
            app.LocationLabel.HorizontalAlignment = 'right';
            app.LocationLabel.VerticalAlignment = 'top';
            app.LocationLabel.Position = [373 462 61 22];
            app.LocationLabel.Text = 'Location';

            % Create LocationEditField1
            app.LocationEditField1 = uieditfield(app.AudiofileTab1, 'text');
            app.LocationEditField1.Editable = 'off';
            app.LocationEditField1.Position = [440 465 473 22];

            % Create Play1Button
            app.Play1Button = uibutton(app.AudiofileTab1, 'push');
            app.Play1Button.ButtonPushedFcn = createCallbackFcn(app, @Play1ButtonPushed, true);
            app.Play1Button.Icon = 'icons8-play-80.png';
            app.Play1Button.BackgroundColor = [1 1 1];
            app.Play1Button.Position = [146 402 80 80];
            app.Play1Button.Text = '';

            % Create VolumeSlider_3Label
            app.VolumeSlider_3Label = uilabel(app.AudiofileTab1);
            app.VolumeSlider_3Label.HorizontalAlignment = 'right';
            app.VolumeSlider_3Label.Position = [631 441 46 22];
            app.VolumeSlider_3Label.Text = 'Volume';

            % Create VolumeSlider_1
            app.VolumeSlider_1 = uislider(app.AudiofileTab1);
            app.VolumeSlider_1.ValueChangedFcn = createCallbackFcn(app, @VolumeSlider_1ValueChanged, true);
            app.VolumeSlider_1.Position = [570 432 170 3];
            app.VolumeSlider_1.Value = 64;

            % Create ModeSwitch_1
            app.ModeSwitch_1 = uiswitch(app.AudiofileTab1, 'slider');
            app.ModeSwitch_1.Items = {'Stereo', 'Mono'};
            app.ModeSwitch_1.ValueChangedFcn = createCallbackFcn(app, @ModeSwitch_1ValueChanged, true);
            app.ModeSwitch_1.Position = [828 423 45 20];
            app.ModeSwitch_1.Value = 'Mono';

            % Create Button_2
            app.Button_2 = uibutton(app.AudiofileTab1, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.Icon = 'icons8-stop-80.png';
            app.Button_2.Position = [241 402 80 80];
            app.Button_2.Text = '';

            % Create SampleRateLabel_2
            app.SampleRateLabel_2 = uilabel(app.AudiofileTab1);
            app.SampleRateLabel_2.HorizontalAlignment = 'right';
            app.SampleRateLabel_2.Position = [355 431 76 22];
            app.SampleRateLabel_2.Text = 'Sample Rate';

            % Create ShSampleRate1
            app.ShSampleRate1 = uieditfield(app.AudiofileTab1, 'text');
            app.ShSampleRate1.Editable = 'off';
            app.ShSampleRate1.Position = [440 431 56 22];

            % Create RecordTab1
            app.RecordTab1 = uitab(app.TabSignal1);
            app.RecordTab1.Title = 'Record (Mono)';

            % Create AudioRec1Plot
            app.AudioRec1Plot = uiaxes(app.RecordTab1);
            title(app.AudioRec1Plot, 'Input (Rec)')
            xlabel(app.AudioRec1Plot, 't [s]')
            ylabel(app.AudioRec1Plot, 'Amplitude')
            app.AudioRec1Plot.GridAlpha = 0.4;
            app.AudioRec1Plot.MinorGridAlpha = 0.5;
            app.AudioRec1Plot.Box = 'on';
            app.AudioRec1Plot.XGrid = 'on';
            app.AudioRec1Plot.XMinorGrid = 'on';
            app.AudioRec1Plot.YGrid = 'on';
            app.AudioRec1Plot.YMinorGrid = 'on';
            app.AudioRec1Plot.Position = [10 10 900 400];

            % Create Rec1Button
            app.Rec1Button = uibutton(app.RecordTab1, 'push');
            app.Rec1Button.ButtonPushedFcn = createCallbackFcn(app, @Rec1ButtonPushed, true);
            app.Rec1Button.Icon = 'icons8-grabar-80.png';
            app.Rec1Button.IconAlignment = 'center';
            app.Rec1Button.BackgroundColor = [0.9608 0.9608 0.9608];
            app.Rec1Button.Position = [52 402 80 80];
            app.Rec1Button.Text = '';

            % Create StopRec1Button
            app.StopRec1Button = uibutton(app.RecordTab1, 'push');
            app.StopRec1Button.ButtonPushedFcn = createCallbackFcn(app, @StopRec1ButtonPushed, true);
            app.StopRec1Button.Icon = 'icons8-detener-40.png';
            app.StopRec1Button.IconAlignment = 'center';
            app.StopRec1Button.BackgroundColor = [0.9608 0.9608 0.9608];
            app.StopRec1Button.FontSize = 20;
            app.StopRec1Button.Position = [146 402 39 39];
            app.StopRec1Button.Text = '';

            % Create PlayRec1Button
            app.PlayRec1Button = uibutton(app.RecordTab1, 'push');
            app.PlayRec1Button.ButtonPushedFcn = createCallbackFcn(app, @PlayRec1ButtonPushed, true);
            app.PlayRec1Button.Icon = 'icons8-play-40.png';
            app.PlayRec1Button.Position = [146 443 39 39];
            app.PlayRec1Button.Text = '';

            % Create TabSignal2
            app.TabSignal2 = uitabgroup(app.InputsPanel);
            app.TabSignal2.Position = [951 9 920 520];

            % Create AudiofileTab2
            app.AudiofileTab2 = uitab(app.TabSignal2);
            app.AudiofileTab2.Title = 'Audio file (Mono/Stereo)';

            % Create Audio2RPlot
            app.Audio2RPlot = uiaxes(app.AudiofileTab2);
            title(app.Audio2RPlot, 'Right Channel')
            xlabel(app.Audio2RPlot, 't [s]')
            ylabel(app.Audio2RPlot, 'Amplitude')
            app.Audio2RPlot.GridAlpha = 0.4;
            app.Audio2RPlot.MinorGridAlpha = 0.5;
            app.Audio2RPlot.Box = 'on';
            app.Audio2RPlot.XMinorTick = 'on';
            app.Audio2RPlot.YMinorTick = 'on';
            app.Audio2RPlot.XGrid = 'on';
            app.Audio2RPlot.XMinorGrid = 'on';
            app.Audio2RPlot.YGrid = 'on';
            app.Audio2RPlot.YMinorGrid = 'on';
            app.Audio2RPlot.Position = [10 10 900 200];

            % Create Audio2LPlot
            app.Audio2LPlot = uiaxes(app.AudiofileTab2);
            title(app.Audio2LPlot, 'Left Channel')
            xlabel(app.Audio2LPlot, 't [s]')
            ylabel(app.Audio2LPlot, 'Amplitude')
            app.Audio2LPlot.GridAlpha = 0.4;
            app.Audio2LPlot.MinorGridAlpha = 0.5;
            app.Audio2LPlot.Box = 'on';
            app.Audio2LPlot.XMinorTick = 'on';
            app.Audio2LPlot.YMinorTick = 'on';
            app.Audio2LPlot.XGrid = 'on';
            app.Audio2LPlot.XMinorGrid = 'on';
            app.Audio2LPlot.YGrid = 'on';
            app.Audio2LPlot.YMinorGrid = 'on';
            app.Audio2LPlot.Position = [10 215 900 200];

            % Create LoadAudio2
            app.LoadAudio2 = uibutton(app.AudiofileTab2, 'push');
            app.LoadAudio2.ButtonPushedFcn = createCallbackFcn(app, @LoadAudio2Pushed, true);
            app.LoadAudio2.Icon = 'icons8-musical-80.png';
            app.LoadAudio2.BackgroundColor = [1 1 1];
            app.LoadAudio2.Position = [52 402 80 80];
            app.LoadAudio2.Text = '';

            % Create LocationEditFieldLabel
            app.LocationEditFieldLabel = uilabel(app.AudiofileTab2);
            app.LocationEditFieldLabel.HorizontalAlignment = 'right';
            app.LocationEditFieldLabel.VerticalAlignment = 'top';
            app.LocationEditFieldLabel.Position = [379 462 51 22];
            app.LocationEditFieldLabel.Text = 'Location';

            % Create LocationEditField2
            app.LocationEditField2 = uieditfield(app.AudiofileTab2, 'text');
            app.LocationEditField2.Editable = 'off';
            app.LocationEditField2.Position = [440 465 473 22];

            % Create Play2Button
            app.Play2Button = uibutton(app.AudiofileTab2, 'push');
            app.Play2Button.ButtonPushedFcn = createCallbackFcn(app, @Play2ButtonPushed, true);
            app.Play2Button.Icon = 'icons8-play-80.png';
            app.Play2Button.BackgroundColor = [1 1 1];
            app.Play2Button.Position = [146 402 80 80];
            app.Play2Button.Text = '';

            % Create VolumeSliderLabel
            app.VolumeSliderLabel = uilabel(app.AudiofileTab2);
            app.VolumeSliderLabel.HorizontalAlignment = 'right';
            app.VolumeSliderLabel.Position = [632 441 46 22];
            app.VolumeSliderLabel.Text = 'Volume';

            % Create VolumeSlider_2
            app.VolumeSlider_2 = uislider(app.AudiofileTab2);
            app.VolumeSlider_2.ValueChangedFcn = createCallbackFcn(app, @VolumeSlider_2ValueChanged, true);
            app.VolumeSlider_2.Position = [570 432 170 3];
            app.VolumeSlider_2.Value = 64;

            % Create ModeSwitch_2
            app.ModeSwitch_2 = uiswitch(app.AudiofileTab2, 'slider');
            app.ModeSwitch_2.Items = {'Stereo', 'Mono'};
            app.ModeSwitch_2.ValueChangedFcn = createCallbackFcn(app, @ModeSwitch_2ValueChanged, true);
            app.ModeSwitch_2.Position = [828 423 45 20];
            app.ModeSwitch_2.Value = 'Stereo';

            % Create Button
            app.Button = uibutton(app.AudiofileTab2, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Icon = 'icons8-stop-80.png';
            app.Button.Position = [243 402 80 80];
            app.Button.Text = '';

            % Create SampleRateLabel
            app.SampleRateLabel = uilabel(app.AudiofileTab2);
            app.SampleRateLabel.HorizontalAlignment = 'right';
            app.SampleRateLabel.Position = [355 431 75 22];
            app.SampleRateLabel.Text = 'Sample Rate';

            % Create ShSampleRate2
            app.ShSampleRate2 = uieditfield(app.AudiofileTab2, 'text');
            app.ShSampleRate2.Editable = 'off';
            app.ShSampleRate2.Position = [440 431 56 22];

            % Create RecordMonoTab_2
            app.RecordMonoTab_2 = uitab(app.TabSignal2);
            app.RecordMonoTab_2.Title = 'Record (Mono)';

            % Create AudioRec2Plot
            app.AudioRec2Plot = uiaxes(app.RecordMonoTab_2);
            title(app.AudioRec2Plot, 'Title')
            xlabel(app.AudioRec2Plot, 'X')
            ylabel(app.AudioRec2Plot, 'Y')
            app.AudioRec2Plot.GridAlpha = 0.4;
            app.AudioRec2Plot.MinorGridAlpha = 0.5;
            app.AudioRec2Plot.Box = 'on';
            app.AudioRec2Plot.XMinorTick = 'on';
            app.AudioRec2Plot.YMinorTick = 'on';
            app.AudioRec2Plot.XGrid = 'on';
            app.AudioRec2Plot.XMinorGrid = 'on';
            app.AudioRec2Plot.YGrid = 'on';
            app.AudioRec2Plot.YMinorGrid = 'on';
            app.AudioRec2Plot.Position = [10 10 900 400];

            % Create Rec2Button
            app.Rec2Button = uibutton(app.RecordMonoTab_2, 'push');
            app.Rec2Button.ButtonPushedFcn = createCallbackFcn(app, @Rec2ButtonPushed, true);
            app.Rec2Button.Icon = 'icons8-grabar-80.png';
            app.Rec2Button.Position = [52 402 80 80];
            app.Rec2Button.Text = '';

            % Create StopRec2Button
            app.StopRec2Button = uibutton(app.RecordMonoTab_2, 'push');
            app.StopRec2Button.ButtonPushedFcn = createCallbackFcn(app, @StopRec2ButtonPushed, true);
            app.StopRec2Button.Icon = 'icons8-detener-40.png';
            app.StopRec2Button.Position = [146 443 39 39];
            app.StopRec2Button.Text = '';

            % Create PlayRec2Button
            app.PlayRec2Button = uibutton(app.RecordMonoTab_2, 'push');
            app.PlayRec2Button.ButtonPushedFcn = createCallbackFcn(app, @PlayRec2ButtonPushed, true);
            app.PlayRec2Button.Icon = 'icons8-play-40.png';
            app.PlayRec2Button.Position = [146 402 39 39];
            app.PlayRec2Button.Text = '';

            % Create DSPPanel
            app.DSPPanel = uipanel(app.Base);
            app.DSPPanel.Title = 'DSP';
            app.DSPPanel.FontWeight = 'bold';
            app.DSPPanel.Position = [10 10 438 480];

            % Create FIRPanel
            app.FIRPanel = uipanel(app.DSPPanel);
            app.FIRPanel.Title = 'FIR';
            app.FIRPanel.FontAngle = 'italic';
            app.FIRPanel.Position = [11 388 420 62];

            % Create ConvolutionfilterhnEditFieldLabel
            app.ConvolutionfilterhnEditFieldLabel = uilabel(app.FIRPanel);
            app.ConvolutionfilterhnEditFieldLabel.HorizontalAlignment = 'right';
            app.ConvolutionfilterhnEditFieldLabel.VerticalAlignment = 'top';
            app.ConvolutionfilterhnEditFieldLabel.Position = [1 -9 131 38];
            app.ConvolutionfilterhnEditFieldLabel.Text = ' Convolution filter "h(n)"';

            % Create ConvolutionfilterEditField
            app.ConvolutionfilterEditField = uieditfield(app.FIRPanel, 'text');
            app.ConvolutionfilterEditField.Position = [146 10 264 22];

            % Create IIRPanel
            app.IIRPanel = uipanel(app.DSPPanel);
            app.IIRPanel.Title = 'IIR';
            app.IIRPanel.FontAngle = 'italic';
            app.IIRPanel.Position = [12 280 419 100];

            % Create AkEditFieldLabel
            app.AkEditFieldLabel = uilabel(app.IIRPanel);
            app.AkEditFieldLabel.HorizontalAlignment = 'right';
            app.AkEditFieldLabel.VerticalAlignment = 'top';
            app.AkEditFieldLabel.Position = [10 46 20 22];
            app.AkEditFieldLabel.Text = 'Ak';

            % Create AkEditField
            app.AkEditField = uieditfield(app.IIRPanel, 'text');
            app.AkEditField.Position = [48 49 361 22];

            % Create BkEditFieldLabel
            app.BkEditFieldLabel = uilabel(app.IIRPanel);
            app.BkEditFieldLabel.HorizontalAlignment = 'right';
            app.BkEditFieldLabel.VerticalAlignment = 'top';
            app.BkEditFieldLabel.Position = [14 9 19 22];
            app.BkEditFieldLabel.Text = 'Bk';

            % Create BkEditField
            app.BkEditField = uieditfield(app.IIRPanel, 'text');
            app.BkEditField.Position = [51 12 358 22];

            % Create MoreoperationsPanel
            app.MoreoperationsPanel = uipanel(app.DSPPanel);
            app.MoreoperationsPanel.Title = 'More operations';
            app.MoreoperationsPanel.FontAngle = 'italic';
            app.MoreoperationsPanel.Position = [12 138 277 135];

            % Create SumsignalsButton
            app.SumsignalsButton = uibutton(app.MoreoperationsPanel, 'push');
            app.SumsignalsButton.ButtonPushedFcn = createCallbackFcn(app, @SumsignalsButtonPushed, true);
            app.SumsignalsButton.BackgroundColor = [1 1 1];
            app.SumsignalsButton.Position = [11 82 139 22];
            app.SumsignalsButton.Text = 'Sum signals';

            % Create SubliminalMessagesButton
            app.SubliminalMessagesButton = uibutton(app.MoreoperationsPanel, 'push');
            app.SubliminalMessagesButton.ButtonPushedFcn = createCallbackFcn(app, @SubliminalMessagesButtonPushed, true);
            app.SubliminalMessagesButton.BackgroundColor = [1 1 1];
            app.SubliminalMessagesButton.Position = [11 9 139 22];
            app.SubliminalMessagesButton.Text = 'Subliminal Messages!';

            % Create MultiplySignalsButton
            app.MultiplySignalsButton = uibutton(app.MoreoperationsPanel, 'push');
            app.MultiplySignalsButton.ButtonPushedFcn = createCallbackFcn(app, @MultiplySignalsButtonPushed, true);
            app.MultiplySignalsButton.Position = [11 44 139 22];
            app.MultiplySignalsButton.Text = 'Multiply Signals';

            % Create SaveFIRFilterButton
            app.SaveFIRFilterButton = uibutton(app.MoreoperationsPanel, 'push');
            app.SaveFIRFilterButton.ButtonPushedFcn = createCallbackFcn(app, @SaveFIRFilterButtonPushed, true);
            app.SaveFIRFilterButton.BackgroundColor = [1 1 1];
            app.SaveFIRFilterButton.Position = [162 82 100 22];
            app.SaveFIRFilterButton.Text = 'Save FIR Filter';

            % Create SaveIIRFilterButton
            app.SaveIIRFilterButton = uibutton(app.MoreoperationsPanel, 'push');
            app.SaveIIRFilterButton.ButtonPushedFcn = createCallbackFcn(app, @SaveIIRFilterButtonPushed, true);
            app.SaveIIRFilterButton.Position = [162 44 100 22];
            app.SaveIIRFilterButton.Text = 'Save IIR Filter';

            % Create ApplyfiltertoDropDownLabel
            app.ApplyfiltertoDropDownLabel = uilabel(app.DSPPanel);
            app.ApplyfiltertoDropDownLabel.HorizontalAlignment = 'right';
            app.ApplyfiltertoDropDownLabel.Position = [26 105 75 22];
            app.ApplyfiltertoDropDownLabel.Text = 'Apply filter to';

            % Create ApplyfiltertoDropDown
            app.ApplyfiltertoDropDown = uidropdown(app.DSPPanel);
            app.ApplyfiltertoDropDown.Items = {'Demo', 'Audio 1', 'Audio 2', 'Rec 1', 'Rec 2', 'Operation', 'Inverted'};
            app.ApplyfiltertoDropDown.ValueChangedFcn = createCallbackFcn(app, @ApplyfiltertoDropDownValueChanged, true);
            app.ApplyfiltertoDropDown.Position = [115 105 100 22];
            app.ApplyfiltertoDropDown.Value = 'Demo';

            % Create OperatebetweenDropDownLabel
            app.OperatebetweenDropDownLabel = uilabel(app.DSPPanel);
            app.OperatebetweenDropDownLabel.HorizontalAlignment = 'right';
            app.OperatebetweenDropDownLabel.Position = [2 73 105 22];
            app.OperatebetweenDropDownLabel.Text = 'Operate between';

            % Create OperatebetweenDropDown
            app.OperatebetweenDropDown = uidropdown(app.DSPPanel);
            app.OperatebetweenDropDown.Items = {'Audio 1 + Audio 2', 'Audio 1 + Rec 1', 'Audio 1 + Rec 2', 'Audio 2 + Rec 1', 'Audio 2 + Rec 2', 'Rec 1 + Rec 2'};
            app.OperatebetweenDropDown.ValueChangedFcn = createCallbackFcn(app, @OperatebetweenDropDownValueChanged, true);
            app.OperatebetweenDropDown.Position = [115 73 100 22];
            app.OperatebetweenDropDown.Value = 'Audio 1 + Audio 2';

            % Create InvertDropDownLabel
            app.InvertDropDownLabel = uilabel(app.DSPPanel);
            app.InvertDropDownLabel.HorizontalAlignment = 'right';
            app.InvertDropDownLabel.Position = [270 105 36 22];
            app.InvertDropDownLabel.Text = 'Invert';

            % Create InvertDropDown
            app.InvertDropDown = uidropdown(app.DSPPanel);
            app.InvertDropDown.Items = {'Audio 1', 'Audio 2', 'Rec 1', 'Rec 2'};
            app.InvertDropDown.ValueChangedFcn = createCallbackFcn(app, @InvertDropDownValueChanged, true);
            app.InvertDropDown.Position = [321 105 100 22];
            app.InvertDropDown.Value = 'Audio 1';

            % Create StopButton_3
            app.StopButton_3 = uibutton(app.DSPPanel, 'push');
            app.StopButton_3.ButtonPushedFcn = createCallbackFcn(app, @StopButton_3Pushed, true);
            app.StopButton_3.Icon = 'icons8-detener-16.png';
            app.StopButton_3.Position = [376 42 22 22];
            app.StopButton_3.Text = '';

            % Create PlayinoutputDropDownLabel
            app.PlayinoutputDropDownLabel = uilabel(app.DSPPanel);
            app.PlayinoutputDropDownLabel.HorizontalAlignment = 'right';
            app.PlayinoutputDropDownLabel.Position = [228 73 78 22];
            app.PlayinoutputDropDownLabel.Text = 'Play in output';

            % Create PlayinoutputDropDown
            app.PlayinoutputDropDown = uidropdown(app.DSPPanel);
            app.PlayinoutputDropDown.Items = {'Filtered', 'Inverted', 'Operated'};
            app.PlayinoutputDropDown.ValueChangedFcn = createCallbackFcn(app, @PlayinoutputDropDownValueChanged, true);
            app.PlayinoutputDropDown.Position = [321 73 100 22];
            app.PlayinoutputDropDown.Value = 'Filtered';

            % Create OutputVolumeKnobLabel
            app.OutputVolumeKnobLabel = uilabel(app.DSPPanel);
            app.OutputVolumeKnobLabel.HorizontalAlignment = 'center';
            app.OutputVolumeKnobLabel.Position = [321 138 85 22];
            app.OutputVolumeKnobLabel.Text = 'Output Volume';

            % Create OutputVolumeKnob
            app.OutputVolumeKnob = uiknob(app.DSPPanel, 'continuous');
            app.OutputVolumeKnob.ValueChangedFcn = createCallbackFcn(app, @OutputVolumeKnobValueChanged, true);
            app.OutputVolumeKnob.Position = [330 191 60 60];
            app.OutputVolumeKnob.Value = 64;

            % Create SelectsamplerateDropDownLabel
            app.SelectsamplerateDropDownLabel = uilabel(app.DSPPanel);
            app.SelectsamplerateDropDownLabel.HorizontalAlignment = 'right';
            app.SelectsamplerateDropDownLabel.Position = [2 42 105 22];
            app.SelectsamplerateDropDownLabel.Text = 'Select sample rate';

            % Create SelectsamplerateDropDown
            app.SelectsamplerateDropDown = uidropdown(app.DSPPanel);
            app.SelectsamplerateDropDown.Items = {'8kHz', '16kHz', '44.1kHz', '48kHz', '96kHz'};
            app.SelectsamplerateDropDown.ValueChangedFcn = createCallbackFcn(app, @SelectsamplerateDropDownValueChanged, true);
            app.SelectsamplerateDropDown.Position = [115 42 100 22];
            app.SelectsamplerateDropDown.Value = '16kHz';

            % Create StatusEditFieldLabel
            app.StatusEditFieldLabel = uilabel(app.DSPPanel);
            app.StatusEditFieldLabel.HorizontalAlignment = 'right';
            app.StatusEditFieldLabel.Position = [21 10 40 22];
            app.StatusEditFieldLabel.Text = 'Status';

            % Create StatusEditField
            app.StatusEditField = uieditfield(app.DSPPanel, 'text');
            app.StatusEditField.Editable = 'off';
            app.StatusEditField.Position = [76 10 331 22];

            % Create PlayButton
            app.PlayButton = uibutton(app.DSPPanel, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Icon = 'icons8-reproducir-en-círculo-16.png';
            app.PlayButton.Position = [335 42 22 22];
            app.PlayButton.Text = '';

            % Create OutputPanel
            app.OutputPanel = uipanel(app.Base);
            app.OutputPanel.Title = 'Output';
            app.OutputPanel.FontWeight = 'bold';
            app.OutputPanel.Position = [462 10 1428 480];

            % Create AudioOutLPlot
            app.AudioOutLPlot = uiaxes(app.OutputPanel);
            title(app.AudioOutLPlot, 'Left Channel')
            xlabel(app.AudioOutLPlot, 't [s]')
            ylabel(app.AudioOutLPlot, 'Amplitude')
            app.AudioOutLPlot.GridAlpha = 0.4;
            app.AudioOutLPlot.MinorGridAlpha = 0.5;
            app.AudioOutLPlot.Box = 'on';
            app.AudioOutLPlot.XMinorTick = 'on';
            app.AudioOutLPlot.YMinorTick = 'on';
            app.AudioOutLPlot.XGrid = 'on';
            app.AudioOutLPlot.XMinorGrid = 'on';
            app.AudioOutLPlot.YGrid = 'on';
            app.AudioOutLPlot.YMinorGrid = 'on';
            app.AudioOutLPlot.Position = [10 230 1399 215];

            % Create AudioOutRPlot
            app.AudioOutRPlot = uiaxes(app.OutputPanel);
            title(app.AudioOutRPlot, 'Right Channel')
            xlabel(app.AudioOutRPlot, 't [s]')
            ylabel(app.AudioOutRPlot, 'Amplitude')
            app.AudioOutRPlot.GridAlpha = 0.4;
            app.AudioOutRPlot.MinorGridAlpha = 0.5;
            app.AudioOutRPlot.Box = 'on';
            app.AudioOutRPlot.XMinorTick = 'on';
            app.AudioOutRPlot.YMinorTick = 'on';
            app.AudioOutRPlot.XGrid = 'on';
            app.AudioOutRPlot.XMinorGrid = 'on';
            app.AudioOutRPlot.YGrid = 'on';
            app.AudioOutRPlot.YMinorGrid = 'on';
            app.AudioOutRPlot.Position = [10 10 1399 215];
        end
    end

    methods (Access = public)

        % Construct app
        function app = Audio_Processor_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.Base)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.Base)
        end
    end
end