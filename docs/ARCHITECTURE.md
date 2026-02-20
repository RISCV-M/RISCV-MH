# Overall Test Architecture

## Boot Sequence
The boot sequence involves several critical steps to ensure that the system is correctly initialized. The process starts when the power is applied, leading to the following actions:

1. **Power On Reset**: The system resets all components to ensure a known state.
2. **Boot ROM Execution**: The boot ROM is executed, which sets up the memory controller and other essential peripherals.
3. **Jump to Firmware**: After initialization, control is passed to the firmware that sets up the execution environment.

## Hart Initialization Flow
The Hardware Threads (harts) are initialized as follows:
1. **Configure Hart Registers**: Each hart's control and status registers are set up according to the desired execution settings.
2. **Set Stack Pointers**: Each hart gets its stack pointer initialized to a defined base address.
3. **Execute Initialization Code**: Harts begin executing their respective initialization routines to prepare for test execution.

## Test Execution Flow
The test execution flow can be divided into several stages:
1. **Load Test Code**: Test binaries are loaded into the specified memory regions.
2. **Start Harts**: All harts are started in parallel to execute their assigned tests.
3. **Monitor Results**: A monitoring mechanism checks each hart’s status and collects results after execution.

## Memory Layout
The memory layout is critical for efficient test execution. The typical layout includes:
- **Boot ROM**: Located at the start of memory for quick access during boot.
- **Test Code Area**: A designated region for loading test binaries.
- **Shared Data Area**: A memory space for harts to share data during test execution.
- **Heap & Stack Areas**: Memory segments allocated for dynamic memory and per-hart stacks.

## Interrupt Handling
Interrupts are managed as follows:
1. **Interrupt Vector Table**: A table residing in a known memory location that directs interrupts to the appropriate handler.
2. **Handler Execution**: When an interrupt occurs, context is saved, and the corresponding handler is executed.
3. **Return from Interrupt**: Finally, context is restored, and execution continues seamlessly.

## Test Synchronization Mechanisms
To ensure that tests execute in a controlled manner, various synchronization mechanisms are implemented:
- **Semaphores**: Used to control access to shared resources among harts.
- **Barriers**: Ensure that all harts reach a certain point in execution before proceeding.
- **Flags**: Simple flags are used for lightweight signaling between harts.

This architecture provides a structured approach to the testing process while ensuring resource efficiency and reliability across multiple execution threads.