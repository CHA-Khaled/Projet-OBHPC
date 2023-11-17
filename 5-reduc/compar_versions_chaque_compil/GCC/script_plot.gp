set term pngcairo size 2000,2000
set output "histogram.png"
set title "Versions performances with GCC and multiple flags"
set style data histograms
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.5
set xtic scale 0
set yrange [0:*]
set ylabel "mib/s"
plot "reduc_gcc-O0_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-O0)" linecolor rgb "#00A5E3",\
"reduc_gcc-O1_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-O1)" linecolor rgb "#d473d4",\
"reduc_gcc-O2_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-O2)" linecolor rgb "#48e1ff",\
"reduc_gcc-O3_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-O3)" linecolor rgb "#ff00ff",\
"reduc_gcc-Ofast_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-Ofast)" linecolor rgb "#48ff96",\
"reduc_gcc-Os_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-Os)" linecolor rgb "#606060",\
"reduc_gcc-Og_plotdata.txt" using 2:xtic(1) title "MiB/s (GCC-Og)" linecolor rgb "#ffff00"
