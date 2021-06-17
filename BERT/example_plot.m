% ����ģ�����ݻ�ͼʾ��
% ��������
% load("NV_BERT_0617_LastH.mat");
% ������˵����
% DIMS-����ģ�������ͨ������BERT-baseΪ768��Fs-����Ƶ�ʣ�NUMS-һ��trial��������n-Ƶ����ԭʼ��Ƶ�ʵ���
% Res_All_channel(10x768x500)-ÿtrailÿͨ���Ĺ����ף�10-trial������768-ͨ��������500-�ü����Ƶ�ʵ�������f-��ͼʱ��x�ᣬ��Ӧ��Ƶ�ʵ��ʵ��Ƶ��

LEN = 500;  % ֻ��ǰ500��Ƶ�ʵ�
ITER = 10;  % **�޸��ܵ�����**
% Ts = 1000/Fs;
TITLE = '';
yunit = 'Power';   % Power 

Y_sum = zeros(ITER,1,LEN);  % 10����ÿһ���ƽ��������
Y_avr = zeros(1,LEN);       % 10��ƽ����Ĺ�����
% ��ÿ��ͨ����ƽ��
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
    plot(f(2:LEN),y(2:end),'LineWidth',1,'color',[0.80,0.80,0.80]);     %����ɫϸ��
    hold on
end
plot(f(2:LEN),Y_avr(2:end),'LineWidth',2,'color',[0.00,0.45,0.74]);     %ƽ��ֵ������
hold on
xlabel('Frequency (Hz)');
ylabel(yunit);   % Power (dB) Amplitude
title(TITLE ,'FontSize',16,'fontname','΢���ź�');
xlim([0 4.5]);ylim([0 0.1]) %
% set(gca,'yticklabel',[])% ����ʾy��̶�