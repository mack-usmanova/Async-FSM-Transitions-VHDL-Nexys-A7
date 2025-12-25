# Asynchronous State Machine (“transitions”) in VHDL (Nexys A7)

 **asynchronous sequential circuit** built around three feedback state bits (`Y1`, `Y2`, `Y3`) and two inputs (`X1`, `X2`).  
In other words: the “state” is the three `inout` signals looping back into the logic, and the circuit walks through states based on `X1/X2` patterns.

I implemented the boolean equations in VHDL, enabled the necessary combinational-loop setting in constraints, and verified behavior in simulation with a Tcl script **and** on real hardware (Nexys A7).

---

## Signals (at a glance)

**Inputs**
- `RESET` (active-low)
- `X1`, `X2`

**State (feedback / storage)**
- `Y1`, `Y2`, `Y3` *(declared as `inout` to allow the feedback loop)*

**Outputs**
- `Z`
- `X1_LED`, `X2_LED` (just mirrors of the input switches)

---

## How it’s implemented

The circuit is combinational equations feeding the state bits and output, with reset forcing things back to the start state.

### VHDL: entity + start of logic
![VHDL entity + Y1 equation](assets/vhdl_entity_and_y1_equation.png)

### VHDL: rest of the equations (Y2 / Y3 / Z)
![VHDL equations Y2/Y3/Z](assets/vhdl_equations_y2_y3_z.png)

---

## Constraints (important for async feedback)

Because `Y1/Y2/Y3` feed back into themselves, Vivado needs combinational loops explicitly allowed:

![XDC pin mapping + allow combinational loops](assets/xdc_pinmap_and_allow_loops.png)

---

## Simulation verification (Tcl force script)

I used a Tcl script to force `RESET`, then step through `X1/X2` changes so the circuit visits the intended states:

![Tcl force script (part 1)](assets/tcl_force_script_part1.png)

![Tcl force script (part 2)](assets/tcl_force_script_part2.png)

### Post-route sim waveform
![Post-route simulation waveform](assets/post_route_simulation_waveform.png)

---

## Hardware demo photos (Nexys A7)

A few shots from the board run (LEDs reflecting the active state bits and inputs):

![Hardware photo 1](assets/hardware_grid_page3_02.png)

![Hardware photo 2](assets/hardware_grid_page4_02.png)

![Hardware photo 3](assets/hardware_grid_page5_02.png)

![Hardware photo 4](assets/hardware_grid_page6_02.png)

---

## Notes

- In post-route sim you can see a brief “flicker” in one spot (around the ~650 ns area in my write-up) where the circuit can momentarily touch two reachable states before settling.  
  On the actual board run, following the same input pattern, it landed where expected.

---

## Report

See the included PDF for the full write-up + all screenshots.

## Report 

The write-up + screenshots are in the included PDF above


## Demo video

I also have a video uploaded above showing the project functioning.

