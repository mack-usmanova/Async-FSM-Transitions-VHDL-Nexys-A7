#inputs:
# X1, X2, RESET STD_LOGIC

#outputs:
# Y1, Y2, Y3, Z, X1_LED, X2_LED STD_LOGIC

restart

# apply active low RESET
add_force RESET {0 0ns}

# initialize inputs
add_force X1 {0 0ns}
add_force X2 {0 0ns}

# wait out 150ns
run 150ns

# set active low RESET back to inactive state
add_force RESET {1 0ns}
run 50ns

# go to e
add_force X2 {1 0ns}
run 50ns

# go to e
add_force X1 {1 0ns}
run 50ns

# go to a
add_force X2 {0 0ns}
run 50ns

# go to a
add_force X1 {0 0ns}
run 50ns

# go to e
add_force X2 {1 0ns}
run 50ns

# go to g
add_force X2 {0 0ns}
run 50ns

# go to d
add_force X1 {1 0ns}
run 50ns

# go to g
add_force X1 {0 0ns}
run 50ns

# go to h
add_force X2 {1 0ns}
run 50ns

# go to a
add_force X2 {0 0ns}
run 50ns

# go to e
add_force X2 {1 0ns}
run 50ns

# go to g
add_force X2 {0 0ns}
run 50ns

# go to h
add_force X2 {1 0ns}
run 50ns

# go to e
add_force X1 {1 0ns}
run 50ns

# go to e
add_force X1 {0 0ns}
run 50ns

# go to g
add_force X2 {0 0ns}
run 50ns

# go to d
add_force X1 {1 0ns}
run 50ns

# go to a
add_force X2 {1 0ns}
run 100ns

