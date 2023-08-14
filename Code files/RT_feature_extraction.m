function features = RT_feature_extraction(signal, epsilon)

% % RMS
% rms = sqrt(mean(signal.^2));
% 
% % MAV
% mav = mean(abs(signal));

% LDAMV
% ldamv = log(1/(length(signal)-1)*sum(abs(diff(signal))));

% LDASDV
ldasdv = log(sqrt(1/(length(signal)-1).*sum(diff(signal).^2)));

% MYOP
myop = zeros(1,5);
for i = 1:5
    for k = 1:length(signal)
        if abs(signal(k,i)) >= epsilon
            myop(:,i) = myop(:,i) + 1;
        end
    end
end
myop = myop./length(signal);

% SKEW
skew = skewness(signal);

% CARD
card = zeros(1,5);
for i = 1:5
    y = sort(signal);
    z = zeros(1, length(signal)-1);
    for k = 1:length(signal)-1
        z(1,k) = abs(y(k,i)-y(k+1,i)) > epsilon;
    end
    card(:,i) = sum(z);
end

% KURT
kurt = kurtosis(signal);

% % MMAV1
% for k = 1:length(signal)
%     if k >= 0.25 * length(signal)  &&  k <= 0.75 * length(signal)
%         w = 1;
%     else
%         w= 0.5;
%     end
% end
% mmav1 = (1/length(signal)) * sum(w*abs(signal));
% 
% % MMAV2
% mmav2 = zeros(1,3);
% for i = 1:3
%     for k = 1:length(signal)
%         if k >= 0.25 * length(signal)  &&  k <= 0.75 * length(signal)
%             w = 1;
%         elseif k < 0.25 * length(signal)
%             w = (4*k)/length(signal);
%         else
%             w = 4 * (k - length(signal)) / length(signal);
%         end
%         mmav2(:,i) = mmav2(:,i) + (w*abs(signal(k,i)));
%     end
% end
% mmav2 = (1/length(signal))*mmav2;

% SSC
ssc = zeros(1,5);
for i = 1:5
    for k = 2:length(signal)-1
        if (((signal(k,i)>signal(k-1,i)) && (signal(k,i)>signal(k+1,i))) || ((signal(k,i)<signal(k-1,i)) && (signal(k,i)<signal(k+1,i)))) && (abs(signal(k,i)-signal(k-1,i))>= epsilon || abs(signal(k,i)-signal(k+1,i))>= epsilon)
            ssc(:,i) = ssc(:,i) + 1;
        end
    end
end

% % TM
% order = 4;
% tm = abs((1/length(signal)) * sum(signal.^order));
% 
% % VO
% vo = sum(signal.^order)/length(signal);
% vo = vo.^ (1/order);

% WAMP
wamp = zeros(1,5);
for i = 1:5
    for k = 1:length(signal)-1
        if abs(signal(k,i) - signal(k+1,i)) >= epsilon
            wamp(:,i) = wamp(:,i) + 1;
        end
    end
end

% % WL
% wl = sum(abs(diff(signal)));

% ZC
zc = zeros(1,5);
for i = 1:5
    for k = 1:length(signal)-1
        if ((abs(signal(k,i)-signal(k+1,i))>= epsilon) && ((signal(k,i)*signal(k+1,i))<0))
            zc(:,i) = zc(:,i) + 1; 
        end
    end
end

% AR4
cur_xlpc = real(lpc(signal,4)');
cur_xlpc = cur_xlpc(2:(4+1),:);
ar4 = reshape(cur_xlpc,5*4,1)';

% MFL
mfl = log10(sqrt(sum(diff(signal).^2)));

% ShEn
shen = -sum(((signal.^2)./sum(signal.^2)).*log2(((signal.^2)./sum(signal.^2))))*(1/length(signal));

features = [ldasdv myop skew card kurt ssc wamp zc ar4 mfl shen];

%Eliminate discontinuties in signals, which are -Inf and NaN values
for i = 1:size(features,2)
    feat = features(:,i);
    infIndices = isinf(feat);
    NaNIndices = isnan(feat);
%     infIndicesVec = 1:numel(feat);
%     NaNIndicesVec = 1:numel(feat);
    %feat(infIndices) = interp1(infIndicesVec(~infIndices), feat(~infIndices), infIndicesVec(infIndices));
    feat(infIndices) = 0;
    %feat(NaNIndices) = interp1(NaNIndicesVec(~NaNIndices), feat(~NaNIndices), NaNIndicesVec(NaNIndices));
    feat(NaNIndices) = 0;
    features(:,i) = feat;
% end
   
end