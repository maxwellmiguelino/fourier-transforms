K_values = linspace(-10, 10, 1000);
poles = zeros(4, length(K_values));

for i = 1:length(K_values)
    K = K_values(i);
    num = [K];
    den = [1, -5, 6];
    system = tf(num, den, 1);
    poles(:, i) = pole(system);
end

magnitude_poles = abs(poles);

plot(K_values, magnitude_poles);
xlabel('K');
ylabel('Magnitude of Poles');
