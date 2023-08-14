function filteredSig = TKEO_denoising(signal)

filteredSig = signal;
filteredSig(2:end-1,:) = signal(2:end-1,:).^2 - signal(1:end-2,:).*signal(3:end,:);
% for i = 2:length(signal)-1
%     filteredSig(i,:) = signal(i,:).^2 - signal(i-1,:).*signal(i+1,:);
% end
%filteredSig  = max(filteredSig ,0);
% for i=1:3
%     sEMG = filteredSig(:,i);
%     transients = find(sEMG>5e5);
%     sEMG(transients) = 0;
%     filteredSig(:,i) = sEMG;
% end

end