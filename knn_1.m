function cls = knn_1(test)

load db_tst_nw;
x = db(:,1:15);
gend=db(:,16);
gscatter(x(:,1),x(:,2),gend)
legend('Location','best')

newpoint =test;


line(newpoint(1),newpoint(2),'marker','x','color','k',...
   'markersize',10,'linewidth',2)

Mdl = KDTreeSearcher(x)


[n,d] = knnsearch(Mdl,newpoint,'k',5);
line(x(n,1),x(n,2),'color',[.5 .5 .5],'marker','o',...
    'linestyle','none','markersize',10)

x(n,:)


xlim([2 2.45]);
ylim([1.9 2.6]);
axis square

tabulate(gend(n));

ctr = newpoint - d(end);
diameter = 2*d(end);

tab=tabulate(gend(n))

dist=tab(:,2);
cls=find(dist==max(dist));
return; 


