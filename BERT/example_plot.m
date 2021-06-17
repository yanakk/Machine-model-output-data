% 机器模型数据画图示例
% 加载数据
% load("NV_BERT_0617_LastH.mat");
% 各变量说明：
% DIMS-机器模型输出的通道数，BERT-base为768；Fs-采样频率；NUMS-一个trial的字数；n-频率谱原始的频率点数
% Res_All_channel(10x768x500)-每trail每通道的功率谱，10-trial数量，768-通道数量，500-裁剪后的频率点数量；f-画图时的x轴，对应各频率点的实际频率

LEN = 500;  % 只存前500个频率点
ITER = 10;  % **修改总的组数**
% Ts = 1000/Fs;
TITLE = '';
yunit = 'Power';   % Power 

Y_sum = zeros(ITER,1,LEN);  % 10组中每一组的平均功率谱
Y_avr = zeros(1,LEN);       % 10组平均后的功率谱
% 给每个通道做平均
for i = 1:1:ITER
    Y_sum(i,1,:) = mean(Res_All_channel(i,:,:),2);
    Y_avr = Y_avr + reshape(Y_sum(i,1,:),[1,LEN]);
end
Y_avr = Y_avr / ITER;

%% Final Plot
close all
figure(1)
for i = 1:1:ITER
    y = squeeze(Y_sum(i,1,:));
    plot(f(2:LEN),y(2:end),'LineWidth',1,'color',[0.80,0.80,0.80]);     %画灰色细线
    hold on
end
plot(f(2:LEN),Y_avr(2:end),'LineWidth',2,'color',[0.00,0.45,0.74]);     %平均值画粗线
hold on
xlabel('Frequency (Hz)');
ylabel(yunit);   % Power (dB) Amplitude
title(TITLE ,'FontSize',16,'fontname','微软雅黑');
xlim([0 4.5]);ylim([0 0.1]) %
% set(gca,'yticklabel',[])% 不显示y轴刻度