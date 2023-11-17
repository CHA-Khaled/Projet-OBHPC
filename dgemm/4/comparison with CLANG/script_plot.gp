set term pngcairo size 2000,2000
set output "histogram.png"
set title "dgemm x8 performances with CLANG and multiple flags"
set style data histograms
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.5
set xtic scale 0
set yrange [0:*]
set ylabel "mib/s"
plot "dgemm_clang-O0_plotdata.txt" using 2:xtic(1) title "MiB/s (CLANG-O0)" linecolor rgb "#00A5E3",\
"dgemm_clang-O1_plotdata.txt" using 2:xtic(1) title "MiB/s (CLANG-O1)" linecolor rgb "#d473d4",\
"dgemm_clang-O2_plotdata.txt" using 2:xtic(1) title "MiB/s (CLANG-O2)" linecolor rgb "#48e1ff",\
"dgemm_clang-O3_plotdata.txt" using 2:xtic(1) title "MiB/s (CLANG-O3)" linecolor rgb "#ff00ff",\
"dgemm_clang-Ofast_plotdata.txt" using 2:xtic(1) title "MiB/s (CLANG-Ofast)" linecolor rgb "#48ff96"
