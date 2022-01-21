set terminal png size 1920,1080  
set grid  
set ylabel "Latency in cycles"  
set xlabel "Simulation iteration"  
plot "outSOAgcc.dat" with lines title "C version SOA","outAOSgcc.dat" with lines title "C version AOS"

