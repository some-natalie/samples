 p2ptb1 = plot(Tn,un_max_vel,'-b','linewidth',2);
 grid;
 title('Maximum Velocity vs Natural Period','fontsize',16);
 xlabel('Natural Period (s)','fontsize',14);
 ylabel('Velocity (cm/s)','fontsize',14);
 hold on
 p2ptb2 = plot(Tn,cor_max_vel,'-r','linewidth',2);
 legend('Uncorrected','Baseline Corrected');
 hold off
