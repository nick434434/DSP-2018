function new_x = add_two_harmonics(angular_1, angular_2, amp, x, h, N)

sig = amp * cos(angular_1 * (0:h:h*(N-1)));
sig = sig + 2 * amp * cos(angular_2 * (0:h:h*(N-1)));
new_x = x + sig;

end