if ~exist('cnt','var')
    cnt = 1;
end
percentage = (cnt/(length(folders)*length(cnrFoundfiles)*length(pnr)));
stringProgress = [mfilename ', progress: ' num2str(round(100* percentage) ,2) '%' ];
cnt = cnt + 1;
if ~exist('f','var')
    f = waitbar(0,'message');
end
waitbar((cnt/(length(folders)*length(cnrFoundfiles)*length(pnr))),f,[mfilename ', progress: ' num2str(round(100* percentage ,2)) '%' ]);