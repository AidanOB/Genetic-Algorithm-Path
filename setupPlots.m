function [pathHandle, geneHandle, distHandle] = setupPlots(xMax, yMax, chrome, pop, gen)
    figure(1); clf; hold on;
    pathHandle.start = plot(0,0,'om');
    pathHandle.stop  = plot(0,0,'og');
    pathHandle.locations = plot(0,0,'*r');
    pathHandle.path = plot(0,0,'b');
    axis([-xMax xMax -yMax yMax]);
    grid on;
    hold off;

    M = ones(chrome, pop);
    figure(2); clf; hold on;
    geneHandle = imagesc(M, 'Clipping', 'off');
    colormap(gray(chrome));
    axis([0.5 pop 0.5 chrome])
    hold off;
    distHandle = [];
%     figure(3); clf; hold on;
%     distHandle = plot(0:gen,0,'g');
%     grid on;
%     hold off;
    
end