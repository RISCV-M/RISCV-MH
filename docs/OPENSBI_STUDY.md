# OpenSBI HSM Implementation Research Notes

## Hart State Machine States
- **States:** 0 (Inactive), 1 (Started), 2 (Running), 3 (Suspended), 4 (Stopped)
- **Transitions:**
  - Inactive -> Started via SBI initialization
  - Started -> Running during execution
  - Running -> Suspended on interrupt
  - Suspended -> Running on resume
  - Any state -> Stopped on error

## SBI Call Specifications
- **SBI Calls:**
  - `SBI_SET_HART_STATE`
  - `SBI_GET_HART_STATE`
  - **Parameters:** HART ID, state
  - **Return Codes:** 0 for success, -1 for failure

## IPI Mechanisms
- **Inter-Processor Interrupts (IPI):**
  - **Types:** Software and Hardware
  - **Processing:** Handled in the SBI layer, routing to appropriate hart

## Optimization Insights for Testcase Development
- **Performance Considerations:**
  - Minimize context switching to improve efficiency
  - Use direct SBI calls instead of higher-level abstractions where performance is critical
- **Best Practices:**
  - Ensure adequate logging to trace state transitions
  - Use simulation tools to emulate hart behavior

---

These notes will serve as a foundational guide for understanding the OpenSBI HSM implementation and aid in developing relevant test cases.