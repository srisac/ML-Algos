% Decision boundary
% This code plots the decision boundary for a classifier with respect
% Directly taken from http://www.peteryu.ca/tutorials/matlab/visualize_decision_boundaries

% range of decision boundary (can be changed according to the need)
xrange = [0 20];
yrange = [-1 12];

% step size for how finely you want to visualize the decision boundary (can be changed according to the need)
inc = 0.02;

% generate grid coordinates. This will be the basis of the decision
% boundary visualization.
[x, y] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));

% size of the (x, y) image, which will also be the size of the
% decision boundary image that is used as the plot background.
image_size = size(x);

% Make points fit back into image
xy = [reshape(x, image_size(1)*image_size(2),1) reshape(y, image_size(1)*image_size(2),1)];

% Important
%----------------------------------
% change this part depending on the classifier
% get the decision for each point (each point of 'xy')
% use your classifier here to classify each point
% store the labels (-1 or 1) in idx
% eg- logistic regression
% xy = [xy ones(size(xy,1),1)];
% scores = -(xy * weights);
% expscores = exp(scores);
% test accuracy
% probability = ones(size(xy,1),1)./(ones(size(xy,1),1)+expscores);
% idx = 2*(probability>0.5)-1;
%-----------------------------------
idx = ycalcNonLinear(xy, X_train, Y_train, bias3, SV_all3, alpha_vals3, 2, 3)


% reshape the idx (which contains the class label) into an image.
decisionmap = reshape(idx, image_size);

figure;

%show the image
imagesc(xrange,yrange,decisionmap);
hold on;
set(gca,'ydir','normal');

% colormap for the classes:
cmap =  [0.0 0.8 1; 1 0.8 0.8];
colormap(cmap);

% plot the class test data.
%temp1 = test_X((test_y==-1),:);
%temp2 = test_X((test_y==1),:);

temp1 = X_test((Y_test==-1),:);
temp2 = X_test((Y_test==1),:);
plot(temp1(:,1),temp1(:,2),'bx','linewidth',0.3);
plot(temp2(:,1),temp2(:,2), 'ro','linewidth',0.3);

% include legend
legend('Class -1','Class +1', 'location', 'southeast')
title('Decision Boundary');

% label the axes.
xlabel('x1');
ylabel('x2');

% store the figure
saveas(gcf, 'decision_boundary_1aiii.png');
hold off;
