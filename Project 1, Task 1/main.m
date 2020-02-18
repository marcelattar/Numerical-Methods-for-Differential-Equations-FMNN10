for lambda = 1:5;
    errVSh(lambda,1,0,5);
    hold on;
    legendInfo{lambda} = ['\lambda=' num2str(lambda)];
end
legend(legendInfo);
