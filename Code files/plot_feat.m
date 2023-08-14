function [] = plot_feat(feature)

subplot(311)
plot(feature(:,1))
title('Channel 1')
subplot(312)
plot(feature(:,2))
title('Channel 2')
subplot(313)
plot(feature(:,3))
title('Channel 3')

end