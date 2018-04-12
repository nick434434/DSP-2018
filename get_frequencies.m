function freqs = get_frequencies(X, h)

N = numel(X);

part1 = abs(X(101:130));
k1 = find(part1 == max(part1)) + 100;
freq1 = k1 / (N*h);

part2 = abs(X(241:260));
k2 = find(part2 == max(part2)) + 240;
freq2 = k2 / (N*h);

freqs = [freq1, freq2];

end