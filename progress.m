if ~exist('cnt','var')
    cnt = 1;
end
disp([mfilename ', progress: ' num2str(round(100* (cnt / ()) ,1)) '%' ]);
cnt = cnt + 1;

disp([mfilename ', progress: ' num2str(round(100* _A_ / _B_ ,1)) '%' ]);