// Generator : SpinalHDL v1.4.4    git head : 24f37223890054708116118aba3dc8e8af944ef0
// Component : VexRiscvWithDebug
// Git hash  : 755478f93a8201698566841c7e8e3b557c6a2dcf


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define JtagState_defaultEncoding_type [3:0]
`define JtagState_defaultEncoding_RESET 4'b0000
`define JtagState_defaultEncoding_IDLE 4'b0001
`define JtagState_defaultEncoding_IR_SELECT 4'b0010
`define JtagState_defaultEncoding_IR_CAPTURE 4'b0011
`define JtagState_defaultEncoding_IR_SHIFT 4'b0100
`define JtagState_defaultEncoding_IR_EXIT1 4'b0101
`define JtagState_defaultEncoding_IR_PAUSE 4'b0110
`define JtagState_defaultEncoding_IR_EXIT2 4'b0111
`define JtagState_defaultEncoding_IR_UPDATE 4'b1000
`define JtagState_defaultEncoding_DR_SELECT 4'b1001
`define JtagState_defaultEncoding_DR_CAPTURE 4'b1010
`define JtagState_defaultEncoding_DR_SHIFT 4'b1011
`define JtagState_defaultEncoding_DR_EXIT1 4'b1100
`define JtagState_defaultEncoding_DR_PAUSE 4'b1101
`define JtagState_defaultEncoding_DR_EXIT2 4'b1110
`define JtagState_defaultEncoding_DR_UPDATE 4'b1111


module VexRiscvTop (
  output              io_iBus_cmd_valid,
  input               io_iBus_cmd_ready,
  output     [31:0]   io_iBus_cmd_payload_pc,
  input               io_iBus_rsp_valid,
  input               io_iBus_rsp_payload_error,
  input      [31:0]   io_iBus_rsp_payload_inst,
  output              io_dBus_cmd_valid,
  input               io_dBus_cmd_ready,
  output              io_dBus_cmd_payload_wr,
  output     [31:0]   io_dBus_cmd_payload_address,
  output     [31:0]   io_dBus_cmd_payload_data,
  output     [1:0]    io_dBus_cmd_payload_size,
  input               io_dBus_rsp_ready,
  input               io_dBus_rsp_error,
  input      [31:0]   io_dBus_rsp_data,
  input               io_timerInterrupt,
  input               io_externalInterrupt,
  input               clk,
  input               reset
);
  wire                io_jtag_tms;
  wire                io_jtag_tdi;
  wire                io_jtag_tdo;
  wire                io_jtag_tck;

  assign io_jtag_tms    = 1'b0;
  assign io_jtag_tdi    = 1'b0;
  assign io_jtag_tck    = 1'b0;

  wire                _zz_VexRiscvWithDebug_2;
  wire       [7:0]    _zz_VexRiscvWithDebug_3;
  wire                cpu_iBus_cmd_valid;
  wire       [31:0]   cpu_iBus_cmd_payload_pc;
  wire                cpu_debug_bus_cmd_ready;
  wire       [31:0]   cpu_debug_bus_rsp_data;
  wire                cpu_debug_resetOut;
  wire                cpu_dBus_cmd_valid;
  wire                cpu_dBus_cmd_payload_wr;
  wire       [31:0]   cpu_dBus_cmd_payload_address;
  wire       [31:0]   cpu_dBus_cmd_payload_data;
  wire       [1:0]    cpu_dBus_cmd_payload_size;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  reg                 _zz_VexRiscvWithDebug_1;

  VexRiscv cpu (
    .iBus_cmd_valid                   (cpu_iBus_cmd_valid                              ), //o
    .iBus_cmd_ready                   (io_iBus_cmd_ready                               ), //i
    .iBus_cmd_payload_pc              (cpu_iBus_cmd_payload_pc[31:0]                   ), //o
    .iBus_rsp_valid                   (io_iBus_rsp_valid                               ), //i
    .iBus_rsp_payload_error           (io_iBus_rsp_payload_error                       ), //i
    .iBus_rsp_payload_inst            (io_iBus_rsp_payload_inst[31:0]                  ), //i
    .timerInterrupt                   (io_timerInterrupt                               ), //i
    .externalInterrupt                (io_externalInterrupt                            ), //i
    .softwareInterrupt                (_zz_VexRiscvWithDebug_2                         ), //i
    .debug_bus_cmd_valid              (systemDebugger_1_io_mem_cmd_valid               ), //i
    .debug_bus_cmd_ready              (cpu_debug_bus_cmd_ready                         ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1_io_mem_cmd_payload_wr          ), //i
    .debug_bus_cmd_payload_address    (_zz_VexRiscvWithDebug_3[7:0]                    ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1_io_mem_cmd_payload_data[31:0]  ), //i
    .debug_bus_rsp_data               (cpu_debug_bus_rsp_data[31:0]                    ), //o
    .debug_resetOut                   (cpu_debug_resetOut                              ), //o
    .dBus_cmd_valid                   (cpu_dBus_cmd_valid                              ), //o
    .dBus_cmd_ready                   (io_dBus_cmd_ready                               ), //i
    .dBus_cmd_payload_wr              (cpu_dBus_cmd_payload_wr                         ), //o
    .dBus_cmd_payload_address         (cpu_dBus_cmd_payload_address[31:0]              ), //o
    .dBus_cmd_payload_data            (cpu_dBus_cmd_payload_data[31:0]                 ), //o
    .dBus_cmd_payload_size            (cpu_dBus_cmd_payload_size[1:0]                  ), //o
    .dBus_rsp_ready                   (io_dBus_rsp_ready                               ), //i
    .dBus_rsp_error                   (io_dBus_rsp_error                               ), //i
    .dBus_rsp_data                    (io_dBus_rsp_data[31:0]                          ), //i
    .clk                              (clk                                             ), //i
    .reset                            (reset                                           )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                       (io_jtag_tms                                        ), //i
    .io_jtag_tdi                       (io_jtag_tdi                                        ), //i
    .io_jtag_tdo                       (jtagBridge_1_io_jtag_tdo                           ), //o
    .io_jtag_tck                       (io_jtag_tck                                        ), //i
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //o
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //i
    .clk                               (clk                                                ), //i
    .reset                             (reset                                              )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //i
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (cpu_debug_bus_cmd_ready                            ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (_zz_VexRiscvWithDebug_1                            ), //i
    .io_mem_rsp_payload                (cpu_debug_bus_rsp_data[31:0]                       ), //i
    .clk                               (clk                                                ), //i
    .reset                             (reset                                              )  //i
  );
  assign io_iBus_cmd_valid = cpu_iBus_cmd_valid;
  assign io_iBus_cmd_payload_pc = cpu_iBus_cmd_payload_pc;
  assign io_dBus_cmd_valid = cpu_dBus_cmd_valid;
  assign io_dBus_cmd_payload_wr = cpu_dBus_cmd_payload_wr;
  assign io_dBus_cmd_payload_address = cpu_dBus_cmd_payload_address;
  assign io_dBus_cmd_payload_data = cpu_dBus_cmd_payload_data;
  assign io_dBus_cmd_payload_size = cpu_dBus_cmd_payload_size;
  assign _zz_VexRiscvWithDebug_3 = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign io_jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign _zz_VexRiscvWithDebug_2 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_VexRiscvWithDebug_1 <= 1'b0;
    end else begin
      _zz_VexRiscvWithDebug_1 <= (systemDebugger_1_io_mem_cmd_valid && cpu_debug_bus_cmd_ready);
    end
  end


endmodule

module SystemDebugger (
  input               io_remote_cmd_valid,
  output              io_remote_cmd_ready,
  input               io_remote_cmd_payload_last,
  input      [0:0]    io_remote_cmd_payload_fragment,
  output              io_remote_rsp_valid,
  input               io_remote_rsp_ready,
  output              io_remote_rsp_payload_error,
  output     [31:0]   io_remote_rsp_payload_data,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output              io_mem_cmd_payload_wr,
  output     [1:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload,
  input               clk,
  input               reset
);
  wire                _zz_SystemDebugger_2;
  wire       [0:0]    _zz_SystemDebugger_3;
  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire       [66:0]   _zz_SystemDebugger_1;

  assign _zz_SystemDebugger_2 = (dispatcher_headerLoaded == 1'b0);
  assign _zz_SystemDebugger_3 = _zz_SystemDebugger_1[64 : 64];
  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_SystemDebugger_1 = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_SystemDebugger_1[31 : 0];
  assign io_mem_cmd_payload_data = _zz_SystemDebugger_1[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_SystemDebugger_3[0];
  assign io_mem_cmd_payload_size = _zz_SystemDebugger_1[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid)begin
        if(_zz_SystemDebugger_2)begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if((dispatcher_counter == 3'b111))begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last)begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! (io_mem_cmd_valid && (! io_mem_cmd_ready)))))begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(io_remote_cmd_valid)begin
      if(_zz_SystemDebugger_2)begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module JtagBridge (
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               clk,
  input               reset
);
  wire                _zz_JtagBridge_11;
  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire       [1:0]    _zz_JtagBridge_12;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire       `JtagState_defaultEncoding_type jtag_tap_fsm_stateNext;
  reg        `JtagState_defaultEncoding_type jtag_tap_fsm_state = `JtagState_defaultEncoding_RESET;
  reg        `JtagState_defaultEncoding_type _zz_JtagBridge_1;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                _zz_JtagBridge_2;
  reg        [31:0]   _zz_JtagBridge_3;
  wire                _zz_JtagBridge_4;
  wire                _zz_JtagBridge_5;
  wire       [0:0]    _zz_JtagBridge_6;
  reg                 _zz_JtagBridge_7;
  reg                 _zz_JtagBridge_8;
  wire                _zz_JtagBridge_9;
  reg        [33:0]   _zz_JtagBridge_10;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_JtagBridge_1_string;
  `endif


  assign _zz_JtagBridge_12 = 2'b01;
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (_zz_JtagBridge_7                             ), //i
    .io_input_payload_last         (_zz_JtagBridge_11                            ), //i
    .io_input_payload_fragment     (_zz_JtagBridge_6                             ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .io_jtag_tck                   (io_jtag_tck                                  ), //i
    .clk                           (clk                                          ), //i
    .reset                         (reset                                        )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      `JtagState_defaultEncoding_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_RESET : jtag_tap_fsm_state_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_JtagBridge_1)
      `JtagState_defaultEncoding_RESET : _zz_JtagBridge_1_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : _zz_JtagBridge_1_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : _zz_JtagBridge_1_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : _zz_JtagBridge_1_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : _zz_JtagBridge_1_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : _zz_JtagBridge_1_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : _zz_JtagBridge_1_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : _zz_JtagBridge_1_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : _zz_JtagBridge_1_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : _zz_JtagBridge_1_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : _zz_JtagBridge_1_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : _zz_JtagBridge_1_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : _zz_JtagBridge_1_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : _zz_JtagBridge_1_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : _zz_JtagBridge_1_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : _zz_JtagBridge_1_string = "DR_UPDATE ";
      default : _zz_JtagBridge_1_string = "??????????";
    endcase
  end
  `endif

  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_ready = 1'b1;
  always @ (*) begin
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IDLE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      `JtagState_defaultEncoding_IR_SELECT : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_RESET : `JtagState_defaultEncoding_IR_CAPTURE);
      end
      `JtagState_defaultEncoding_IR_CAPTURE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT1 : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT1 : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_EXIT1 : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_IR_UPDATE : `JtagState_defaultEncoding_IR_PAUSE);
      end
      `JtagState_defaultEncoding_IR_PAUSE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT2 : `JtagState_defaultEncoding_IR_PAUSE);
      end
      `JtagState_defaultEncoding_IR_EXIT2 : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_IR_UPDATE : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      `JtagState_defaultEncoding_DR_SELECT : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_IR_SELECT : `JtagState_defaultEncoding_DR_CAPTURE);
      end
      `JtagState_defaultEncoding_DR_CAPTURE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT1 : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT1 : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_EXIT1 : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_UPDATE : `JtagState_defaultEncoding_DR_PAUSE);
      end
      `JtagState_defaultEncoding_DR_PAUSE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT2 : `JtagState_defaultEncoding_DR_PAUSE);
      end
      `JtagState_defaultEncoding_DR_EXIT2 : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_UPDATE : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_UPDATE : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      default : begin
        _zz_JtagBridge_1 = (io_jtag_tms ? `JtagState_defaultEncoding_RESET : `JtagState_defaultEncoding_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_JtagBridge_1;
  always @ (*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    jtag_tap_tdoDr = 1'b0;
    if(_zz_JtagBridge_2)begin
      jtag_tap_tdoDr = _zz_JtagBridge_3[0];
    end
    if(_zz_JtagBridge_4)begin
      jtag_tap_tdoDr = 1'b0;
    end
    if(_zz_JtagBridge_9)begin
      jtag_tap_tdoDr = _zz_JtagBridge_10[0];
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign _zz_JtagBridge_2 = (jtag_tap_instruction == 4'b0001);
  assign _zz_JtagBridge_6[0] = _zz_JtagBridge_8;
  assign _zz_JtagBridge_11 = (! (_zz_JtagBridge_4 && _zz_JtagBridge_5));
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign _zz_JtagBridge_4 = (jtag_tap_instruction == 4'b0010);
  assign _zz_JtagBridge_5 = (jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT);
  assign _zz_JtagBridge_9 = (jtag_tap_instruction == 4'b0011);
  always @ (posedge clk) begin
    if(io_remote_cmd_valid)begin
      system_rsp_valid <= 1'b0;
    end
    if((io_remote_rsp_valid && io_remote_rsp_ready))begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @ (posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_JtagBridge_12};
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      default : begin
      end
    endcase
    if(_zz_JtagBridge_2)begin
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT))begin
        _zz_JtagBridge_3 <= ({io_jtag_tdi,_zz_JtagBridge_3} >>> 1);
      end
    end
    if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_CAPTURE))begin
      _zz_JtagBridge_3 <= 32'h10001fff;
    end
    if((jtag_tap_fsm_state == `JtagState_defaultEncoding_RESET))begin
      jtag_tap_instruction <= 4'b0001;
    end
    _zz_JtagBridge_7 <= (_zz_JtagBridge_4 && _zz_JtagBridge_5);
    _zz_JtagBridge_8 <= io_jtag_tdi;
    if(_zz_JtagBridge_9)begin
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_CAPTURE))begin
        _zz_JtagBridge_10 <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT))begin
        _zz_JtagBridge_10 <= ({io_jtag_tdi,_zz_JtagBridge_10} >>> 1);
      end
    end
  end

  always @ (negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               clk,
  input               reset
);
  wire                _zz_VexRiscv_173;
  wire                _zz_VexRiscv_174;
  reg        [31:0]   _zz_VexRiscv_175;
  reg        [31:0]   _zz_VexRiscv_176;
  reg        [31:0]   _zz_VexRiscv_177;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_VexRiscv_178;
  wire                _zz_VexRiscv_179;
  wire                _zz_VexRiscv_180;
  wire                _zz_VexRiscv_181;
  wire                _zz_VexRiscv_182;
  wire                _zz_VexRiscv_183;
  wire                _zz_VexRiscv_184;
  wire                _zz_VexRiscv_185;
  wire                _zz_VexRiscv_186;
  wire                _zz_VexRiscv_187;
  wire                _zz_VexRiscv_188;
  wire                _zz_VexRiscv_189;
  wire       [1:0]    _zz_VexRiscv_190;
  wire                _zz_VexRiscv_191;
  wire                _zz_VexRiscv_192;
  wire                _zz_VexRiscv_193;
  wire                _zz_VexRiscv_194;
  wire                _zz_VexRiscv_195;
  wire                _zz_VexRiscv_196;
  wire                _zz_VexRiscv_197;
  wire       [1:0]    _zz_VexRiscv_198;
  wire                _zz_VexRiscv_199;
  wire                _zz_VexRiscv_200;
  wire                _zz_VexRiscv_201;
  wire                _zz_VexRiscv_202;
  wire                _zz_VexRiscv_203;
  wire                _zz_VexRiscv_204;
  wire                _zz_VexRiscv_205;
  wire                _zz_VexRiscv_206;
  wire       [5:0]    _zz_VexRiscv_207;
  wire                _zz_VexRiscv_208;
  wire                _zz_VexRiscv_209;
  wire                _zz_VexRiscv_210;
  wire                _zz_VexRiscv_211;
  wire                _zz_VexRiscv_212;
  wire       [4:0]    _zz_VexRiscv_213;
  wire       [1:0]    _zz_VexRiscv_214;
  wire       [1:0]    _zz_VexRiscv_215;
  wire       [1:0]    _zz_VexRiscv_216;
  wire                _zz_VexRiscv_217;
  wire       [1:0]    _zz_VexRiscv_218;
  wire       [65:0]   _zz_VexRiscv_219;
  wire       [63:0]   _zz_VexRiscv_220;
  wire       [32:0]   _zz_VexRiscv_221;
  wire       [31:0]   _zz_VexRiscv_222;
  wire       [32:0]   _zz_VexRiscv_223;
  wire       [0:0]    _zz_VexRiscv_224;
  wire       [0:0]    _zz_VexRiscv_225;
  wire       [0:0]    _zz_VexRiscv_226;
  wire       [0:0]    _zz_VexRiscv_227;
  wire       [0:0]    _zz_VexRiscv_228;
  wire       [0:0]    _zz_VexRiscv_229;
  wire       [0:0]    _zz_VexRiscv_230;
  wire       [0:0]    _zz_VexRiscv_231;
  wire       [0:0]    _zz_VexRiscv_232;
  wire       [0:0]    _zz_VexRiscv_233;
  wire       [2:0]    _zz_VexRiscv_234;
  wire       [31:0]   _zz_VexRiscv_235;
  wire       [0:0]    _zz_VexRiscv_236;
  wire       [0:0]    _zz_VexRiscv_237;
  wire       [0:0]    _zz_VexRiscv_238;
  wire       [0:0]    _zz_VexRiscv_239;
  wire       [0:0]    _zz_VexRiscv_240;
  wire       [0:0]    _zz_VexRiscv_241;
  wire       [2:0]    _zz_VexRiscv_242;
  wire       [2:0]    _zz_VexRiscv_243;
  wire       [31:0]   _zz_VexRiscv_244;
  wire       [2:0]    _zz_VexRiscv_245;
  wire       [31:0]   _zz_VexRiscv_246;
  wire       [31:0]   _zz_VexRiscv_247;
  wire       [11:0]   _zz_VexRiscv_248;
  wire       [11:0]   _zz_VexRiscv_249;
  wire       [11:0]   _zz_VexRiscv_250;
  wire       [31:0]   _zz_VexRiscv_251;
  wire       [19:0]   _zz_VexRiscv_252;
  wire       [11:0]   _zz_VexRiscv_253;
  wire       [2:0]    _zz_VexRiscv_254;
  wire       [0:0]    _zz_VexRiscv_255;
  wire       [2:0]    _zz_VexRiscv_256;
  wire       [0:0]    _zz_VexRiscv_257;
  wire       [2:0]    _zz_VexRiscv_258;
  wire       [0:0]    _zz_VexRiscv_259;
  wire       [2:0]    _zz_VexRiscv_260;
  wire       [0:0]    _zz_VexRiscv_261;
  wire       [2:0]    _zz_VexRiscv_262;
  wire       [2:0]    _zz_VexRiscv_263;
  wire       [1:0]    _zz_VexRiscv_264;
  wire       [1:0]    _zz_VexRiscv_265;
  wire       [0:0]    _zz_VexRiscv_266;
  wire       [0:0]    _zz_VexRiscv_267;
  wire       [5:0]    _zz_VexRiscv_268;
  wire       [32:0]   _zz_VexRiscv_269;
  wire       [31:0]   _zz_VexRiscv_270;
  wire       [31:0]   _zz_VexRiscv_271;
  wire       [32:0]   _zz_VexRiscv_272;
  wire       [32:0]   _zz_VexRiscv_273;
  wire       [32:0]   _zz_VexRiscv_274;
  wire       [32:0]   _zz_VexRiscv_275;
  wire       [0:0]    _zz_VexRiscv_276;
  wire       [32:0]   _zz_VexRiscv_277;
  wire       [0:0]    _zz_VexRiscv_278;
  wire       [32:0]   _zz_VexRiscv_279;
  wire       [0:0]    _zz_VexRiscv_280;
  wire       [31:0]   _zz_VexRiscv_281;
  wire       [2:0]    _zz_VexRiscv_282;
  wire       [4:0]    _zz_VexRiscv_283;
  wire       [11:0]   _zz_VexRiscv_284;
  wire       [11:0]   _zz_VexRiscv_285;
  wire       [31:0]   _zz_VexRiscv_286;
  wire       [31:0]   _zz_VexRiscv_287;
  wire       [31:0]   _zz_VexRiscv_288;
  wire       [31:0]   _zz_VexRiscv_289;
  wire       [31:0]   _zz_VexRiscv_290;
  wire       [31:0]   _zz_VexRiscv_291;
  wire       [31:0]   _zz_VexRiscv_292;
  wire       [11:0]   _zz_VexRiscv_293;
  wire       [19:0]   _zz_VexRiscv_294;
  wire       [11:0]   _zz_VexRiscv_295;
  wire       [2:0]    _zz_VexRiscv_296;
  wire       [0:0]    _zz_VexRiscv_297;
  wire       [0:0]    _zz_VexRiscv_298;
  wire       [0:0]    _zz_VexRiscv_299;
  wire       [0:0]    _zz_VexRiscv_300;
  wire       [0:0]    _zz_VexRiscv_301;
  wire       [0:0]    _zz_VexRiscv_302;
  wire                _zz_VexRiscv_303;
  wire                _zz_VexRiscv_304;
  wire       [1:0]    _zz_VexRiscv_305;
  wire       [31:0]   _zz_VexRiscv_306;
  wire       [31:0]   _zz_VexRiscv_307;
  wire       [31:0]   _zz_VexRiscv_308;
  wire                _zz_VexRiscv_309;
  wire       [0:0]    _zz_VexRiscv_310;
  wire       [11:0]   _zz_VexRiscv_311;
  wire       [31:0]   _zz_VexRiscv_312;
  wire       [31:0]   _zz_VexRiscv_313;
  wire       [31:0]   _zz_VexRiscv_314;
  wire                _zz_VexRiscv_315;
  wire       [0:0]    _zz_VexRiscv_316;
  wire       [5:0]    _zz_VexRiscv_317;
  wire       [31:0]   _zz_VexRiscv_318;
  wire       [31:0]   _zz_VexRiscv_319;
  wire       [31:0]   _zz_VexRiscv_320;
  wire                _zz_VexRiscv_321;
  wire                _zz_VexRiscv_322;
  wire                _zz_VexRiscv_323;
  wire                _zz_VexRiscv_324;
  wire       [6:0]    _zz_VexRiscv_325;
  wire       [4:0]    _zz_VexRiscv_326;
  wire                _zz_VexRiscv_327;
  wire       [4:0]    _zz_VexRiscv_328;
  wire       [0:0]    _zz_VexRiscv_329;
  wire       [7:0]    _zz_VexRiscv_330;
  wire                _zz_VexRiscv_331;
  wire       [0:0]    _zz_VexRiscv_332;
  wire       [0:0]    _zz_VexRiscv_333;
  wire       [31:0]   _zz_VexRiscv_334;
  wire       [31:0]   _zz_VexRiscv_335;
  wire       [31:0]   _zz_VexRiscv_336;
  wire       [31:0]   _zz_VexRiscv_337;
  wire       [0:0]    _zz_VexRiscv_338;
  wire       [0:0]    _zz_VexRiscv_339;
  wire       [2:0]    _zz_VexRiscv_340;
  wire       [2:0]    _zz_VexRiscv_341;
  wire                _zz_VexRiscv_342;
  wire       [0:0]    _zz_VexRiscv_343;
  wire       [24:0]   _zz_VexRiscv_344;
  wire       [31:0]   _zz_VexRiscv_345;
  wire       [31:0]   _zz_VexRiscv_346;
  wire       [31:0]   _zz_VexRiscv_347;
  wire       [31:0]   _zz_VexRiscv_348;
  wire                _zz_VexRiscv_349;
  wire                _zz_VexRiscv_350;
  wire       [0:0]    _zz_VexRiscv_351;
  wire       [0:0]    _zz_VexRiscv_352;
  wire                _zz_VexRiscv_353;
  wire       [0:0]    _zz_VexRiscv_354;
  wire       [21:0]   _zz_VexRiscv_355;
  wire       [31:0]   _zz_VexRiscv_356;
  wire       [31:0]   _zz_VexRiscv_357;
  wire       [31:0]   _zz_VexRiscv_358;
  wire                _zz_VexRiscv_359;
  wire       [0:0]    _zz_VexRiscv_360;
  wire       [0:0]    _zz_VexRiscv_361;
  wire                _zz_VexRiscv_362;
  wire       [0:0]    _zz_VexRiscv_363;
  wire       [17:0]   _zz_VexRiscv_364;
  wire       [31:0]   _zz_VexRiscv_365;
  wire       [31:0]   _zz_VexRiscv_366;
  wire       [31:0]   _zz_VexRiscv_367;
  wire       [31:0]   _zz_VexRiscv_368;
  wire                _zz_VexRiscv_369;
  wire       [1:0]    _zz_VexRiscv_370;
  wire       [1:0]    _zz_VexRiscv_371;
  wire                _zz_VexRiscv_372;
  wire       [0:0]    _zz_VexRiscv_373;
  wire       [13:0]   _zz_VexRiscv_374;
  wire       [31:0]   _zz_VexRiscv_375;
  wire       [31:0]   _zz_VexRiscv_376;
  wire                _zz_VexRiscv_377;
  wire                _zz_VexRiscv_378;
  wire       [0:0]    _zz_VexRiscv_379;
  wire       [0:0]    _zz_VexRiscv_380;
  wire       [1:0]    _zz_VexRiscv_381;
  wire       [1:0]    _zz_VexRiscv_382;
  wire                _zz_VexRiscv_383;
  wire       [0:0]    _zz_VexRiscv_384;
  wire       [10:0]   _zz_VexRiscv_385;
  wire       [31:0]   _zz_VexRiscv_386;
  wire       [31:0]   _zz_VexRiscv_387;
  wire       [31:0]   _zz_VexRiscv_388;
  wire       [31:0]   _zz_VexRiscv_389;
  wire       [31:0]   _zz_VexRiscv_390;
  wire       [31:0]   _zz_VexRiscv_391;
  wire       [0:0]    _zz_VexRiscv_392;
  wire       [3:0]    _zz_VexRiscv_393;
  wire       [4:0]    _zz_VexRiscv_394;
  wire       [4:0]    _zz_VexRiscv_395;
  wire                _zz_VexRiscv_396;
  wire       [0:0]    _zz_VexRiscv_397;
  wire       [7:0]    _zz_VexRiscv_398;
  wire                _zz_VexRiscv_399;
  wire       [0:0]    _zz_VexRiscv_400;
  wire       [0:0]    _zz_VexRiscv_401;
  wire                _zz_VexRiscv_402;
  wire       [0:0]    _zz_VexRiscv_403;
  wire       [1:0]    _zz_VexRiscv_404;
  wire       [0:0]    _zz_VexRiscv_405;
  wire       [3:0]    _zz_VexRiscv_406;
  wire       [0:0]    _zz_VexRiscv_407;
  wire       [0:0]    _zz_VexRiscv_408;
  wire       [1:0]    _zz_VexRiscv_409;
  wire       [1:0]    _zz_VexRiscv_410;
  wire                _zz_VexRiscv_411;
  wire       [0:0]    _zz_VexRiscv_412;
  wire       [4:0]    _zz_VexRiscv_413;
  wire       [31:0]   _zz_VexRiscv_414;
  wire       [31:0]   _zz_VexRiscv_415;
  wire       [31:0]   _zz_VexRiscv_416;
  wire       [31:0]   _zz_VexRiscv_417;
  wire       [31:0]   _zz_VexRiscv_418;
  wire       [31:0]   _zz_VexRiscv_419;
  wire       [31:0]   _zz_VexRiscv_420;
  wire       [31:0]   _zz_VexRiscv_421;
  wire                _zz_VexRiscv_422;
  wire                _zz_VexRiscv_423;
  wire       [31:0]   _zz_VexRiscv_424;
  wire       [31:0]   _zz_VexRiscv_425;
  wire                _zz_VexRiscv_426;
  wire       [0:0]    _zz_VexRiscv_427;
  wire       [1:0]    _zz_VexRiscv_428;
  wire       [31:0]   _zz_VexRiscv_429;
  wire       [31:0]   _zz_VexRiscv_430;
  wire                _zz_VexRiscv_431;
  wire                _zz_VexRiscv_432;
  wire       [0:0]    _zz_VexRiscv_433;
  wire       [0:0]    _zz_VexRiscv_434;
  wire                _zz_VexRiscv_435;
  wire       [0:0]    _zz_VexRiscv_436;
  wire       [2:0]    _zz_VexRiscv_437;
  wire       [31:0]   _zz_VexRiscv_438;
  wire       [31:0]   _zz_VexRiscv_439;
  wire       [31:0]   _zz_VexRiscv_440;
  wire       [31:0]   _zz_VexRiscv_441;
  wire       [31:0]   _zz_VexRiscv_442;
  wire                _zz_VexRiscv_443;
  wire                _zz_VexRiscv_444;
  wire       [31:0]   _zz_VexRiscv_445;
  wire       [31:0]   _zz_VexRiscv_446;
  wire       [31:0]   _zz_VexRiscv_447;
  wire       [31:0]   _zz_VexRiscv_448;
  wire       [0:0]    _zz_VexRiscv_449;
  wire       [2:0]    _zz_VexRiscv_450;
  wire       [0:0]    _zz_VexRiscv_451;
  wire       [0:0]    _zz_VexRiscv_452;
  wire                _zz_VexRiscv_453;
  wire       [0:0]    _zz_VexRiscv_454;
  wire       [0:0]    _zz_VexRiscv_455;
  wire       [31:0]   _zz_VexRiscv_456;
  wire       [31:0]   _zz_VexRiscv_457;
  wire       [31:0]   _zz_VexRiscv_458;
  wire                _zz_VexRiscv_459;
  wire                _zz_VexRiscv_460;
  wire       [31:0]   _zz_VexRiscv_461;
  wire                _zz_VexRiscv_462;
  wire       [0:0]    _zz_VexRiscv_463;
  wire       [0:0]    _zz_VexRiscv_464;
  wire       [0:0]    _zz_VexRiscv_465;
  wire       [0:0]    _zz_VexRiscv_466;
  wire       [0:0]    _zz_VexRiscv_467;
  wire       [0:0]    _zz_VexRiscv_468;
  wire                _zz_VexRiscv_469;
  wire                _zz_VexRiscv_470;
  wire                _zz_VexRiscv_471;
  wire       [63:0]   memory_MUL;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [32:0]   execute_MUL_OPB;
  wire       [32:0]   execute_MUL_OPA;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_2;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_3;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_4;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_5;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_6;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_7;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_8;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_9;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_10;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_11;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_12;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_13;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_14;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_15;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_16;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_17;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_18;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_19;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_20;
  wire                decode_MEMORY_ENABLE;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire                execute_IS_RVC;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_21;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_22;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_23;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_VexRiscv_24;
  wire       [31:0]   _zz_VexRiscv_25;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_26;
  wire       [31:0]   _zz_VexRiscv_27;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_28;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire                execute_IS_RS1_SIGNED;
  wire       [31:0]   execute_RS1;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  reg        [31:0]   _zz_VexRiscv_29;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire       [63:0]   writeBack_MUL;
  wire                writeBack_IS_MUL;
  wire       [32:0]   memory_MUL_OPB;
  wire       [32:0]   memory_MUL_OPA;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_30;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_31;
  wire       [31:0]   _zz_VexRiscv_32;
  wire                _zz_VexRiscv_33;
  reg                 _zz_VexRiscv_34;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_35;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_36;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_37;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_38;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_39;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_40;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_41;
  reg        [31:0]   _zz_VexRiscv_42;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_43;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_44;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_45;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_VexRiscv_46;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_ALIGNEMENT_FAULT;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_47;
  reg        [31:0]   _zz_VexRiscv_48;
  reg        [31:0]   _zz_VexRiscv_49;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusSimplePlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  wire                IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire                IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                IBusSimplePlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusSimplePlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusSimplePlugin_decodeExceptionPort_payload_badAddr;
  reg                 DBusSimplePlugin_memoryExceptionPort_valid;
  reg        [3:0]    DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_VexRiscv_50;
  wire       [2:0]    _zz_VexRiscv_51;
  wire                _zz_VexRiscv_52;
  wire                _zz_VexRiscv_53;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  reg                 IBusSimplePlugin_decodePc_injectedDecode;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_VexRiscv_54;
  wire                _zz_VexRiscv_55;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_VexRiscv_56;
  wire                _zz_VexRiscv_57;
  reg                 _zz_VexRiscv_58;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  reg                 IBusSimplePlugin_decompressor_bufferValidLatch;
  reg                 IBusSimplePlugin_decompressor_throw2BytesLatch;
  wire                IBusSimplePlugin_decompressor_bufferValidPatched;
  wire                IBusSimplePlugin_decompressor_throw2BytesPatched;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_VexRiscv_59;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_VexRiscv_60;
  wire       [4:0]    _zz_VexRiscv_61;
  wire       [11:0]   _zz_VexRiscv_62;
  wire                _zz_VexRiscv_63;
  reg        [11:0]   _zz_VexRiscv_64;
  wire                _zz_VexRiscv_65;
  reg        [9:0]    _zz_VexRiscv_66;
  wire       [20:0]   _zz_VexRiscv_67;
  wire                _zz_VexRiscv_68;
  reg        [14:0]   _zz_VexRiscv_69;
  wire                _zz_VexRiscv_70;
  reg        [2:0]    _zz_VexRiscv_71;
  wire                _zz_VexRiscv_72;
  reg        [9:0]    _zz_VexRiscv_73;
  wire       [20:0]   _zz_VexRiscv_74;
  wire                _zz_VexRiscv_75;
  reg        [4:0]    _zz_VexRiscv_76;
  wire       [12:0]   _zz_VexRiscv_77;
  wire       [4:0]    _zz_VexRiscv_78;
  wire       [4:0]    _zz_VexRiscv_79;
  wire       [4:0]    _zz_VexRiscv_80;
  wire                _zz_VexRiscv_81;
  reg        [2:0]    _zz_VexRiscv_82;
  reg        [2:0]    _zz_VexRiscv_83;
  wire                _zz_VexRiscv_84;
  reg        [6:0]    _zz_VexRiscv_85;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_VexRiscv_86;
  reg        [31:0]   _zz_VexRiscv_87;
  reg                 _zz_VexRiscv_88;
  reg        [31:0]   _zz_VexRiscv_89;
  reg                 _zz_VexRiscv_90;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_VexRiscv_91;
  reg        [18:0]   _zz_VexRiscv_92;
  wire                _zz_VexRiscv_93;
  reg        [10:0]   _zz_VexRiscv_94;
  wire                _zz_VexRiscv_95;
  reg        [18:0]   _zz_VexRiscv_96;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  reg                 IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_VexRiscv_97;
  wire                _zz_VexRiscv_98;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_VexRiscv_99;
  reg        [3:0]    _zz_VexRiscv_100;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_VexRiscv_101;
  reg        [31:0]   _zz_VexRiscv_102;
  wire                _zz_VexRiscv_103;
  reg        [31:0]   _zz_VexRiscv_104;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_VexRiscv_105;
  wire                _zz_VexRiscv_106;
  wire                _zz_VexRiscv_107;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_VexRiscv_108;
  wire                _zz_VexRiscv_109;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [30:0]   _zz_VexRiscv_110;
  wire                _zz_VexRiscv_111;
  wire                _zz_VexRiscv_112;
  wire                _zz_VexRiscv_113;
  wire                _zz_VexRiscv_114;
  wire                _zz_VexRiscv_115;
  wire                _zz_VexRiscv_116;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_117;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_118;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_119;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_120;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_121;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_122;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_123;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_VexRiscv_124;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_VexRiscv_125;
  reg                 execute_MulSimplePlugin_aSigned;
  reg                 execute_MulSimplePlugin_bSigned;
  wire       [31:0]   execute_MulSimplePlugin_a;
  wire       [31:0]   execute_MulSimplePlugin_b;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire       [31:0]   _zz_VexRiscv_126;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_VexRiscv_127;
  wire                _zz_VexRiscv_128;
  wire                _zz_VexRiscv_129;
  reg        [32:0]   _zz_VexRiscv_130;
  reg        [31:0]   _zz_VexRiscv_131;
  wire                _zz_VexRiscv_132;
  reg        [19:0]   _zz_VexRiscv_133;
  wire                _zz_VexRiscv_134;
  reg        [19:0]   _zz_VexRiscv_135;
  reg        [31:0]   _zz_VexRiscv_136;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_VexRiscv_137;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_VexRiscv_138;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                _zz_VexRiscv_139;
  wire                _zz_VexRiscv_140;
  wire                _zz_VexRiscv_141;
  wire                _zz_VexRiscv_142;
  wire                _zz_VexRiscv_143;
  wire                _zz_VexRiscv_144;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_VexRiscv_145;
  reg                 _zz_VexRiscv_146;
  reg                 _zz_VexRiscv_147;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_VexRiscv_148;
  reg        [19:0]   _zz_VexRiscv_149;
  wire                _zz_VexRiscv_150;
  reg        [10:0]   _zz_VexRiscv_151;
  wire                _zz_VexRiscv_152;
  reg        [18:0]   _zz_VexRiscv_153;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_VexRiscv_154;
  reg                 _zz_VexRiscv_155;
  reg                 DebugPlugin_resetIt_regNext;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg                 decode_to_execute_IS_RVC;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        [31:0]   decode_to_execute_SRC1;
  reg        [31:0]   decode_to_execute_SRC2;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg                 decode_to_execute_DO_EBREAK;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [32:0]   execute_to_memory_MUL_OPA;
  reg        [32:0]   execute_to_memory_MUL_OPB;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg        [63:0]   memory_to_writeBack_MUL;
  reg        [2:0]    _zz_VexRiscv_156;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_832;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg                 execute_CsrPlugin_csr_2816;
  reg                 execute_CsrPlugin_csr_2944;
  reg                 execute_CsrPlugin_csr_2818;
  reg                 execute_CsrPlugin_csr_2946;
  reg                 execute_CsrPlugin_csr_3072;
  reg                 execute_CsrPlugin_csr_3200;
  reg                 execute_CsrPlugin_csr_3074;
  reg                 execute_CsrPlugin_csr_3202;
  reg        [31:0]   _zz_VexRiscv_157;
  reg        [31:0]   _zz_VexRiscv_158;
  reg        [31:0]   _zz_VexRiscv_159;
  reg        [31:0]   _zz_VexRiscv_160;
  reg        [31:0]   _zz_VexRiscv_161;
  reg        [31:0]   _zz_VexRiscv_162;
  reg        [31:0]   _zz_VexRiscv_163;
  reg        [31:0]   _zz_VexRiscv_164;
  reg        [31:0]   _zz_VexRiscv_165;
  reg        [31:0]   _zz_VexRiscv_166;
  reg        [31:0]   _zz_VexRiscv_167;
  reg        [31:0]   _zz_VexRiscv_168;
  reg        [31:0]   _zz_VexRiscv_169;
  reg        [31:0]   _zz_VexRiscv_170;
  reg        [31:0]   _zz_VexRiscv_171;
  reg        [31:0]   _zz_VexRiscv_172;
  `ifndef SYNTHESIS
  reg [31:0] _zz_VexRiscv_1_string;
  reg [31:0] _zz_VexRiscv_2_string;
  reg [71:0] _zz_VexRiscv_3_string;
  reg [71:0] _zz_VexRiscv_4_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_5_string;
  reg [71:0] _zz_VexRiscv_6_string;
  reg [71:0] _zz_VexRiscv_7_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_VexRiscv_8_string;
  reg [39:0] _zz_VexRiscv_9_string;
  reg [39:0] _zz_VexRiscv_10_string;
  reg [47:0] _zz_VexRiscv_11_string;
  reg [47:0] _zz_VexRiscv_12_string;
  reg [47:0] _zz_VexRiscv_13_string;
  reg [47:0] _zz_VexRiscv_14_string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_15_string;
  reg [47:0] _zz_VexRiscv_16_string;
  reg [47:0] _zz_VexRiscv_17_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_VexRiscv_18_string;
  reg [63:0] _zz_VexRiscv_19_string;
  reg [63:0] _zz_VexRiscv_20_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_VexRiscv_21_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_22_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_23_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_VexRiscv_26_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_VexRiscv_28_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_VexRiscv_30_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_VexRiscv_31_string;
  reg [31:0] _zz_VexRiscv_35_string;
  reg [71:0] _zz_VexRiscv_36_string;
  reg [39:0] _zz_VexRiscv_37_string;
  reg [47:0] _zz_VexRiscv_38_string;
  reg [23:0] _zz_VexRiscv_39_string;
  reg [63:0] _zz_VexRiscv_40_string;
  reg [95:0] _zz_VexRiscv_41_string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_43_string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_44_string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_45_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_VexRiscv_47_string;
  reg [95:0] _zz_VexRiscv_117_string;
  reg [63:0] _zz_VexRiscv_118_string;
  reg [23:0] _zz_VexRiscv_119_string;
  reg [47:0] _zz_VexRiscv_120_string;
  reg [39:0] _zz_VexRiscv_121_string;
  reg [71:0] _zz_VexRiscv_122_string;
  reg [31:0] _zz_VexRiscv_123_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_VexRiscv_178 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_179 = 1'b1;
  assign _zz_VexRiscv_180 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_181 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_182 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_VexRiscv_183 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_VexRiscv_184 = ({decodeExceptionPort_valid,IBusSimplePlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_VexRiscv_185 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_VexRiscv_186 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign _zz_VexRiscv_187 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_VexRiscv_188 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_VexRiscv_189 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_VexRiscv_190 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_VexRiscv_191 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_VexRiscv_192 = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_payload_rsp_error);
  assign _zz_VexRiscv_193 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign _zz_VexRiscv_194 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_VexRiscv_195 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign _zz_VexRiscv_196 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_VexRiscv_197 = ((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)) && CsrPlugin_allowEbreakException);
  assign _zz_VexRiscv_198 = execute_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_199 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_VexRiscv_200 = (! memory_arbitration_isStuck);
  assign _zz_VexRiscv_201 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_202 = (1'b0 || (! 1'b1));
  assign _zz_VexRiscv_203 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_204 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_VexRiscv_205 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_206 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_VexRiscv_207 = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_VexRiscv_208 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign _zz_VexRiscv_209 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_VexRiscv_210 = ((_zz_VexRiscv_105 && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_211 = ((_zz_VexRiscv_106 && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_212 = ((_zz_VexRiscv_107 && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_213 = {_zz_VexRiscv_59[1 : 0],_zz_VexRiscv_59[15 : 13]};
  assign _zz_VexRiscv_214 = _zz_VexRiscv_59[6 : 5];
  assign _zz_VexRiscv_215 = _zz_VexRiscv_59[11 : 10];
  assign _zz_VexRiscv_216 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_217 = execute_INSTRUCTION[13];
  assign _zz_VexRiscv_218 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_219 = ($signed(memory_MUL_OPA) * $signed(memory_MUL_OPB));
  assign _zz_VexRiscv_220 = _zz_VexRiscv_219[63 : 0];
  assign _zz_VexRiscv_221 = ($signed(_zz_VexRiscv_223) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_VexRiscv_222 = _zz_VexRiscv_221[31 : 0];
  assign _zz_VexRiscv_223 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_VexRiscv_224 = _zz_VexRiscv_110[26 : 26];
  assign _zz_VexRiscv_225 = _zz_VexRiscv_110[25 : 25];
  assign _zz_VexRiscv_226 = _zz_VexRiscv_110[24 : 24];
  assign _zz_VexRiscv_227 = _zz_VexRiscv_110[23 : 23];
  assign _zz_VexRiscv_228 = _zz_VexRiscv_110[19 : 19];
  assign _zz_VexRiscv_229 = _zz_VexRiscv_110[15 : 15];
  assign _zz_VexRiscv_230 = _zz_VexRiscv_110[12 : 12];
  assign _zz_VexRiscv_231 = _zz_VexRiscv_110[11 : 11];
  assign _zz_VexRiscv_232 = _zz_VexRiscv_110[10 : 10];
  assign _zz_VexRiscv_233 = _zz_VexRiscv_110[3 : 3];
  assign _zz_VexRiscv_234 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_235 = {29'd0, _zz_VexRiscv_234};
  assign _zz_VexRiscv_236 = _zz_VexRiscv_110[18 : 18];
  assign _zz_VexRiscv_237 = _zz_VexRiscv_110[14 : 14];
  assign _zz_VexRiscv_238 = _zz_VexRiscv_110[4 : 4];
  assign _zz_VexRiscv_239 = _zz_VexRiscv_110[2 : 2];
  assign _zz_VexRiscv_240 = _zz_VexRiscv_110[22 : 22];
  assign _zz_VexRiscv_241 = _zz_VexRiscv_110[9 : 9];
  assign _zz_VexRiscv_242 = (_zz_VexRiscv_50 - 3'b001);
  assign _zz_VexRiscv_243 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_VexRiscv_244 = {29'd0, _zz_VexRiscv_243};
  assign _zz_VexRiscv_245 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_246 = {29'd0, _zz_VexRiscv_245};
  assign _zz_VexRiscv_247 = {{_zz_VexRiscv_69,_zz_VexRiscv_59[6 : 2]},12'h0};
  assign _zz_VexRiscv_248 = {{{4'b0000,_zz_VexRiscv_59[8 : 7]},_zz_VexRiscv_59[12 : 9]},2'b00};
  assign _zz_VexRiscv_249 = {{{4'b0000,_zz_VexRiscv_59[8 : 7]},_zz_VexRiscv_59[12 : 9]},2'b00};
  assign _zz_VexRiscv_250 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_251 = {{_zz_VexRiscv_92,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_VexRiscv_252 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_VexRiscv_253 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_254 = (IBusSimplePlugin_pending_value + _zz_VexRiscv_256);
  assign _zz_VexRiscv_255 = IBusSimplePlugin_pending_inc;
  assign _zz_VexRiscv_256 = {2'd0, _zz_VexRiscv_255};
  assign _zz_VexRiscv_257 = IBusSimplePlugin_pending_dec;
  assign _zz_VexRiscv_258 = {2'd0, _zz_VexRiscv_257};
  assign _zz_VexRiscv_259 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_VexRiscv_260 = {2'd0, _zz_VexRiscv_259};
  assign _zz_VexRiscv_261 = IBusSimplePlugin_pending_dec;
  assign _zz_VexRiscv_262 = {2'd0, _zz_VexRiscv_261};
  assign _zz_VexRiscv_263 = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz_VexRiscv_264 = (_zz_VexRiscv_108 & (~ _zz_VexRiscv_265));
  assign _zz_VexRiscv_265 = (_zz_VexRiscv_108 - 2'b01);
  assign _zz_VexRiscv_266 = execute_SRC_LESS;
  assign _zz_VexRiscv_267 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_VexRiscv_268 = {5'd0, _zz_VexRiscv_267};
  assign _zz_VexRiscv_269 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_VexRiscv_270 = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_VexRiscv_271 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_VexRiscv_272 = {_zz_VexRiscv_126,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_VexRiscv_273 = _zz_VexRiscv_274;
  assign _zz_VexRiscv_274 = _zz_VexRiscv_275;
  assign _zz_VexRiscv_275 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_VexRiscv_127) : _zz_VexRiscv_127)} + _zz_VexRiscv_277);
  assign _zz_VexRiscv_276 = memory_DivPlugin_div_needRevert;
  assign _zz_VexRiscv_277 = {32'd0, _zz_VexRiscv_276};
  assign _zz_VexRiscv_278 = _zz_VexRiscv_129;
  assign _zz_VexRiscv_279 = {32'd0, _zz_VexRiscv_278};
  assign _zz_VexRiscv_280 = _zz_VexRiscv_128;
  assign _zz_VexRiscv_281 = {31'd0, _zz_VexRiscv_280};
  assign _zz_VexRiscv_282 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_283 = decode_INSTRUCTION[19 : 15];
  assign _zz_VexRiscv_284 = decode_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_285 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_VexRiscv_286 = ($signed(_zz_VexRiscv_287) + $signed(_zz_VexRiscv_290));
  assign _zz_VexRiscv_287 = ($signed(_zz_VexRiscv_288) + $signed(_zz_VexRiscv_289));
  assign _zz_VexRiscv_288 = execute_SRC1;
  assign _zz_VexRiscv_289 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_VexRiscv_290 = (execute_SRC_USE_SUB_LESS ? _zz_VexRiscv_291 : _zz_VexRiscv_292);
  assign _zz_VexRiscv_291 = 32'h00000001;
  assign _zz_VexRiscv_292 = 32'h0;
  assign _zz_VexRiscv_293 = execute_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_294 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_VexRiscv_295 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_296 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_297 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_VexRiscv_298 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_299 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_300 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_VexRiscv_301 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_VexRiscv_302 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_303 = 1'b1;
  assign _zz_VexRiscv_304 = 1'b1;
  assign _zz_VexRiscv_305 = {_zz_VexRiscv_53,_zz_VexRiscv_52};
  assign _zz_VexRiscv_306 = 32'h0000107f;
  assign _zz_VexRiscv_307 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_VexRiscv_308 = 32'h00002073;
  assign _zz_VexRiscv_309 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_VexRiscv_310 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_VexRiscv_311 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_VexRiscv_312) == 32'h00000003),{(_zz_VexRiscv_313 == _zz_VexRiscv_314),{_zz_VexRiscv_315,{_zz_VexRiscv_316,_zz_VexRiscv_317}}}}}};
  assign _zz_VexRiscv_312 = 32'h0000505f;
  assign _zz_VexRiscv_313 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_VexRiscv_314 = 32'h00000063;
  assign _zz_VexRiscv_315 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_VexRiscv_316 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_VexRiscv_317 = {((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & 32'hfc00307f) == 32'h00001013),{((decode_INSTRUCTION & _zz_VexRiscv_318) == 32'h00005033),{(_zz_VexRiscv_319 == _zz_VexRiscv_320),{_zz_VexRiscv_321,_zz_VexRiscv_322}}}}};
  assign _zz_VexRiscv_318 = 32'hbe00707f;
  assign _zz_VexRiscv_319 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_VexRiscv_320 = 32'h00000033;
  assign _zz_VexRiscv_321 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_VexRiscv_322 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_VexRiscv_323 = (_zz_VexRiscv_59[11 : 10] == 2'b01);
  assign _zz_VexRiscv_324 = ((_zz_VexRiscv_59[11 : 10] == 2'b11) && (_zz_VexRiscv_59[6 : 5] == 2'b00));
  assign _zz_VexRiscv_325 = 7'h0;
  assign _zz_VexRiscv_326 = _zz_VexRiscv_59[6 : 2];
  assign _zz_VexRiscv_327 = _zz_VexRiscv_59[12];
  assign _zz_VexRiscv_328 = _zz_VexRiscv_59[11 : 7];
  assign _zz_VexRiscv_329 = decode_INSTRUCTION[31];
  assign _zz_VexRiscv_330 = decode_INSTRUCTION[19 : 12];
  assign _zz_VexRiscv_331 = decode_INSTRUCTION[20];
  assign _zz_VexRiscv_332 = decode_INSTRUCTION[31];
  assign _zz_VexRiscv_333 = decode_INSTRUCTION[7];
  assign _zz_VexRiscv_334 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_VexRiscv_335 = 32'h00000004;
  assign _zz_VexRiscv_336 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_VexRiscv_337 = 32'h00000040;
  assign _zz_VexRiscv_338 = ((decode_INSTRUCTION & _zz_VexRiscv_345) == 32'h00005010);
  assign _zz_VexRiscv_339 = ((decode_INSTRUCTION & _zz_VexRiscv_346) == 32'h00005020);
  assign _zz_VexRiscv_340 = {(_zz_VexRiscv_347 == _zz_VexRiscv_348),{_zz_VexRiscv_349,_zz_VexRiscv_350}};
  assign _zz_VexRiscv_341 = 3'b000;
  assign _zz_VexRiscv_342 = (_zz_VexRiscv_116 != 1'b0);
  assign _zz_VexRiscv_343 = (_zz_VexRiscv_116 != 1'b0);
  assign _zz_VexRiscv_344 = {(_zz_VexRiscv_351 != _zz_VexRiscv_352),{_zz_VexRiscv_353,{_zz_VexRiscv_354,_zz_VexRiscv_355}}};
  assign _zz_VexRiscv_345 = 32'h00007034;
  assign _zz_VexRiscv_346 = 32'h02007064;
  assign _zz_VexRiscv_347 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_VexRiscv_348 = 32'h40001010;
  assign _zz_VexRiscv_349 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz_VexRiscv_350 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz_VexRiscv_351 = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz_VexRiscv_352 = 1'b0;
  assign _zz_VexRiscv_353 = (((decode_INSTRUCTION & _zz_VexRiscv_356) == 32'h02000030) != 1'b0);
  assign _zz_VexRiscv_354 = ((_zz_VexRiscv_357 == _zz_VexRiscv_358) != 1'b0);
  assign _zz_VexRiscv_355 = {(_zz_VexRiscv_359 != 1'b0),{(_zz_VexRiscv_360 != _zz_VexRiscv_361),{_zz_VexRiscv_362,{_zz_VexRiscv_363,_zz_VexRiscv_364}}}};
  assign _zz_VexRiscv_356 = 32'h02004074;
  assign _zz_VexRiscv_357 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_VexRiscv_358 = 32'h00000024;
  assign _zz_VexRiscv_359 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_VexRiscv_360 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_VexRiscv_361 = 1'b0;
  assign _zz_VexRiscv_362 = ({(_zz_VexRiscv_365 == _zz_VexRiscv_366),(_zz_VexRiscv_367 == _zz_VexRiscv_368)} != 2'b00);
  assign _zz_VexRiscv_363 = (_zz_VexRiscv_115 != 1'b0);
  assign _zz_VexRiscv_364 = {(_zz_VexRiscv_369 != 1'b0),{(_zz_VexRiscv_370 != _zz_VexRiscv_371),{_zz_VexRiscv_372,{_zz_VexRiscv_373,_zz_VexRiscv_374}}}};
  assign _zz_VexRiscv_365 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_VexRiscv_366 = 32'h00002000;
  assign _zz_VexRiscv_367 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_VexRiscv_368 = 32'h00001000;
  assign _zz_VexRiscv_369 = ((decode_INSTRUCTION & 32'h10003050) == 32'h00000050);
  assign _zz_VexRiscv_370 = {_zz_VexRiscv_115,(_zz_VexRiscv_375 == _zz_VexRiscv_376)};
  assign _zz_VexRiscv_371 = 2'b00;
  assign _zz_VexRiscv_372 = ({_zz_VexRiscv_377,_zz_VexRiscv_378} != 2'b00);
  assign _zz_VexRiscv_373 = ({_zz_VexRiscv_379,_zz_VexRiscv_380} != 2'b00);
  assign _zz_VexRiscv_374 = {(_zz_VexRiscv_381 != _zz_VexRiscv_382),{_zz_VexRiscv_383,{_zz_VexRiscv_384,_zz_VexRiscv_385}}};
  assign _zz_VexRiscv_375 = (decode_INSTRUCTION & 32'h10003050);
  assign _zz_VexRiscv_376 = 32'h10000050;
  assign _zz_VexRiscv_377 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_VexRiscv_378 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_VexRiscv_379 = ((decode_INSTRUCTION & _zz_VexRiscv_386) == 32'h00000020);
  assign _zz_VexRiscv_380 = ((decode_INSTRUCTION & _zz_VexRiscv_387) == 32'h00000020);
  assign _zz_VexRiscv_381 = {_zz_VexRiscv_114,(_zz_VexRiscv_388 == _zz_VexRiscv_389)};
  assign _zz_VexRiscv_382 = 2'b00;
  assign _zz_VexRiscv_383 = ((_zz_VexRiscv_390 == _zz_VexRiscv_391) != 1'b0);
  assign _zz_VexRiscv_384 = ({_zz_VexRiscv_392,_zz_VexRiscv_393} != 5'h0);
  assign _zz_VexRiscv_385 = {(_zz_VexRiscv_394 != _zz_VexRiscv_395),{_zz_VexRiscv_396,{_zz_VexRiscv_397,_zz_VexRiscv_398}}};
  assign _zz_VexRiscv_386 = 32'h00000034;
  assign _zz_VexRiscv_387 = 32'h00000064;
  assign _zz_VexRiscv_388 = (decode_INSTRUCTION & 32'h00000038);
  assign _zz_VexRiscv_389 = 32'h0;
  assign _zz_VexRiscv_390 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_VexRiscv_391 = 32'h00000020;
  assign _zz_VexRiscv_392 = _zz_VexRiscv_114;
  assign _zz_VexRiscv_393 = {_zz_VexRiscv_112,{_zz_VexRiscv_399,{_zz_VexRiscv_400,_zz_VexRiscv_401}}};
  assign _zz_VexRiscv_394 = {_zz_VexRiscv_112,{_zz_VexRiscv_402,{_zz_VexRiscv_403,_zz_VexRiscv_404}}};
  assign _zz_VexRiscv_395 = 5'h0;
  assign _zz_VexRiscv_396 = ({_zz_VexRiscv_113,{_zz_VexRiscv_405,_zz_VexRiscv_406}} != 6'h0);
  assign _zz_VexRiscv_397 = ({_zz_VexRiscv_407,_zz_VexRiscv_408} != 2'b00);
  assign _zz_VexRiscv_398 = {(_zz_VexRiscv_409 != _zz_VexRiscv_410),{_zz_VexRiscv_411,{_zz_VexRiscv_412,_zz_VexRiscv_413}}};
  assign _zz_VexRiscv_399 = ((decode_INSTRUCTION & _zz_VexRiscv_414) == 32'h00004020);
  assign _zz_VexRiscv_400 = (_zz_VexRiscv_415 == _zz_VexRiscv_416);
  assign _zz_VexRiscv_401 = (_zz_VexRiscv_417 == _zz_VexRiscv_418);
  assign _zz_VexRiscv_402 = ((decode_INSTRUCTION & _zz_VexRiscv_419) == 32'h00002010);
  assign _zz_VexRiscv_403 = (_zz_VexRiscv_420 == _zz_VexRiscv_421);
  assign _zz_VexRiscv_404 = {_zz_VexRiscv_422,_zz_VexRiscv_423};
  assign _zz_VexRiscv_405 = (_zz_VexRiscv_424 == _zz_VexRiscv_425);
  assign _zz_VexRiscv_406 = {_zz_VexRiscv_426,{_zz_VexRiscv_427,_zz_VexRiscv_428}};
  assign _zz_VexRiscv_407 = _zz_VexRiscv_112;
  assign _zz_VexRiscv_408 = (_zz_VexRiscv_429 == _zz_VexRiscv_430);
  assign _zz_VexRiscv_409 = {_zz_VexRiscv_112,_zz_VexRiscv_431};
  assign _zz_VexRiscv_410 = 2'b00;
  assign _zz_VexRiscv_411 = (_zz_VexRiscv_432 != 1'b0);
  assign _zz_VexRiscv_412 = (_zz_VexRiscv_433 != _zz_VexRiscv_434);
  assign _zz_VexRiscv_413 = {_zz_VexRiscv_435,{_zz_VexRiscv_436,_zz_VexRiscv_437}};
  assign _zz_VexRiscv_414 = 32'h00004020;
  assign _zz_VexRiscv_415 = (decode_INSTRUCTION & 32'h00000030);
  assign _zz_VexRiscv_416 = 32'h00000010;
  assign _zz_VexRiscv_417 = (decode_INSTRUCTION & 32'h02000020);
  assign _zz_VexRiscv_418 = 32'h00000020;
  assign _zz_VexRiscv_419 = 32'h00002030;
  assign _zz_VexRiscv_420 = (decode_INSTRUCTION & 32'h00001030);
  assign _zz_VexRiscv_421 = 32'h00000010;
  assign _zz_VexRiscv_422 = ((decode_INSTRUCTION & _zz_VexRiscv_438) == 32'h00002020);
  assign _zz_VexRiscv_423 = ((decode_INSTRUCTION & _zz_VexRiscv_439) == 32'h00000020);
  assign _zz_VexRiscv_424 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_VexRiscv_425 = 32'h00001010;
  assign _zz_VexRiscv_426 = ((decode_INSTRUCTION & _zz_VexRiscv_440) == 32'h00002010);
  assign _zz_VexRiscv_427 = (_zz_VexRiscv_441 == _zz_VexRiscv_442);
  assign _zz_VexRiscv_428 = {_zz_VexRiscv_443,_zz_VexRiscv_444};
  assign _zz_VexRiscv_429 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_VexRiscv_430 = 32'h00000020;
  assign _zz_VexRiscv_431 = ((decode_INSTRUCTION & _zz_VexRiscv_445) == 32'h0);
  assign _zz_VexRiscv_432 = ((decode_INSTRUCTION & _zz_VexRiscv_446) == 32'h00004010);
  assign _zz_VexRiscv_433 = (_zz_VexRiscv_447 == _zz_VexRiscv_448);
  assign _zz_VexRiscv_434 = 1'b0;
  assign _zz_VexRiscv_435 = ({_zz_VexRiscv_449,_zz_VexRiscv_450} != 4'b0000);
  assign _zz_VexRiscv_436 = (_zz_VexRiscv_451 != _zz_VexRiscv_452);
  assign _zz_VexRiscv_437 = {_zz_VexRiscv_453,{_zz_VexRiscv_454,_zz_VexRiscv_455}};
  assign _zz_VexRiscv_438 = 32'h02002060;
  assign _zz_VexRiscv_439 = 32'h02003020;
  assign _zz_VexRiscv_440 = 32'h00002010;
  assign _zz_VexRiscv_441 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_VexRiscv_442 = 32'h00000010;
  assign _zz_VexRiscv_443 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_VexRiscv_444 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz_VexRiscv_445 = 32'h00000020;
  assign _zz_VexRiscv_446 = 32'h00004014;
  assign _zz_VexRiscv_447 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz_VexRiscv_448 = 32'h00002010;
  assign _zz_VexRiscv_449 = ((decode_INSTRUCTION & _zz_VexRiscv_456) == 32'h0);
  assign _zz_VexRiscv_450 = {(_zz_VexRiscv_457 == _zz_VexRiscv_458),{_zz_VexRiscv_459,_zz_VexRiscv_460}};
  assign _zz_VexRiscv_451 = ((decode_INSTRUCTION & _zz_VexRiscv_461) == 32'h0);
  assign _zz_VexRiscv_452 = 1'b0;
  assign _zz_VexRiscv_453 = ({_zz_VexRiscv_462,{_zz_VexRiscv_463,_zz_VexRiscv_464}} != 3'b000);
  assign _zz_VexRiscv_454 = ({_zz_VexRiscv_465,_zz_VexRiscv_466} != 2'b00);
  assign _zz_VexRiscv_455 = ({_zz_VexRiscv_467,_zz_VexRiscv_468} != 2'b00);
  assign _zz_VexRiscv_456 = 32'h00000044;
  assign _zz_VexRiscv_457 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_VexRiscv_458 = 32'h0;
  assign _zz_VexRiscv_459 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_VexRiscv_460 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz_VexRiscv_461 = 32'h00000058;
  assign _zz_VexRiscv_462 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz_VexRiscv_463 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_VexRiscv_464 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz_VexRiscv_465 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_VexRiscv_466 = _zz_VexRiscv_111;
  assign _zz_VexRiscv_467 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_VexRiscv_468 = _zz_VexRiscv_111;
  assign _zz_VexRiscv_469 = execute_INSTRUCTION[31];
  assign _zz_VexRiscv_470 = execute_INSTRUCTION[31];
  assign _zz_VexRiscv_471 = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_VexRiscv_303) begin
      _zz_VexRiscv_175 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_VexRiscv_304) begin
      _zz_VexRiscv_176 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_VexRiscv_34) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_VexRiscv_173                                                ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_VexRiscv_174                                                ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );
  always @(*) begin
    case(_zz_VexRiscv_305)
      2'b00 : begin
        _zz_VexRiscv_177 = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_VexRiscv_177 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_VexRiscv_177 = IBusSimplePlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_VexRiscv_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_1_string = "JALR";
      default : _zz_VexRiscv_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_2_string = "JALR";
      default : _zz_VexRiscv_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_3)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_3_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_3_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_3_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_3_string = "SRA_1    ";
      default : _zz_VexRiscv_3_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_4)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_4_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_4_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_4_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_4_string = "SRA_1    ";
      default : _zz_VexRiscv_4_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_5)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_5_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_5_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_5_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_5_string = "SRA_1    ";
      default : _zz_VexRiscv_5_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_6)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_6_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_6_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_6_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_6_string = "SRA_1    ";
      default : _zz_VexRiscv_6_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_7)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_7_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_7_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_7_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_7_string = "SRA_1    ";
      default : _zz_VexRiscv_7_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_8)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_8_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_8_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_8_string = "AND_1";
      default : _zz_VexRiscv_8_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_9)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_9_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_9_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_9_string = "AND_1";
      default : _zz_VexRiscv_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_10)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_10_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_10_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_10_string = "AND_1";
      default : _zz_VexRiscv_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_11)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_11_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_11_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_11_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_11_string = "EBREAK";
      default : _zz_VexRiscv_11_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_12)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_12_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_12_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_12_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_12_string = "EBREAK";
      default : _zz_VexRiscv_12_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_13)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_13_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_13_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_13_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_13_string = "EBREAK";
      default : _zz_VexRiscv_13_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_14)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_14_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_14_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_14_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_14_string = "EBREAK";
      default : _zz_VexRiscv_14_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_15)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_15_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_15_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_15_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_15_string = "EBREAK";
      default : _zz_VexRiscv_15_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_16)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_16_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_16_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_16_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_16_string = "EBREAK";
      default : _zz_VexRiscv_16_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_17)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_17_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_17_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_17_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_17_string = "EBREAK";
      default : _zz_VexRiscv_17_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_18)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_18_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_18_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_18_string = "BITWISE ";
      default : _zz_VexRiscv_18_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_19)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_19_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_19_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_19_string = "BITWISE ";
      default : _zz_VexRiscv_19_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_20)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_20_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_20_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_20_string = "BITWISE ";
      default : _zz_VexRiscv_20_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_21)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_21_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_21_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_21_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_21_string = "JALR";
      default : _zz_VexRiscv_21_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_22)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_22_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_22_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_22_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_22_string = "SRA_1    ";
      default : _zz_VexRiscv_22_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_23)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_23_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_23_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_23_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_23_string = "SRA_1    ";
      default : _zz_VexRiscv_23_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_26)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_26_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_26_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_26_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_26_string = "PC ";
      default : _zz_VexRiscv_26_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_28)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_28_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_28_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_28_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_28_string = "URS1        ";
      default : _zz_VexRiscv_28_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_30)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_30_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_30_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_30_string = "BITWISE ";
      default : _zz_VexRiscv_30_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_31)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_31_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_31_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_31_string = "AND_1";
      default : _zz_VexRiscv_31_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_35)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_35_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_35_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_35_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_35_string = "JALR";
      default : _zz_VexRiscv_35_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_36)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_36_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_36_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_36_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_36_string = "SRA_1    ";
      default : _zz_VexRiscv_36_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_37)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_37_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_37_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_37_string = "AND_1";
      default : _zz_VexRiscv_37_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_38)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_38_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_38_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_38_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_38_string = "EBREAK";
      default : _zz_VexRiscv_38_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_39)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_39_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_39_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_39_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_39_string = "PC ";
      default : _zz_VexRiscv_39_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_40)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_40_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_40_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_40_string = "BITWISE ";
      default : _zz_VexRiscv_40_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_41)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_41_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_41_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_41_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_41_string = "URS1        ";
      default : _zz_VexRiscv_41_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_43)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_43_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_43_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_43_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_43_string = "EBREAK";
      default : _zz_VexRiscv_43_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_44)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_44_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_44_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_44_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_44_string = "EBREAK";
      default : _zz_VexRiscv_44_string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_45)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_45_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_45_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_45_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_45_string = "EBREAK";
      default : _zz_VexRiscv_45_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_47)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_47_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_47_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_47_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_47_string = "JALR";
      default : _zz_VexRiscv_47_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_117)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_117_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_117_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_117_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_117_string = "URS1        ";
      default : _zz_VexRiscv_117_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_118)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_118_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_118_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_118_string = "BITWISE ";
      default : _zz_VexRiscv_118_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_119)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_119_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_119_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_119_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_119_string = "PC ";
      default : _zz_VexRiscv_119_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_120)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_120_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_120_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_VexRiscv_120_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_120_string = "EBREAK";
      default : _zz_VexRiscv_120_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_121)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_121_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_121_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_121_string = "AND_1";
      default : _zz_VexRiscv_121_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_122)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_122_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_122_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_122_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_122_string = "SRA_1    ";
      default : _zz_VexRiscv_122_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_123)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_123_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_123_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_123_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_123_string = "JALR";
      default : _zz_VexRiscv_123_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL = _zz_VexRiscv_220;
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign execute_SHIFT_RIGHT = _zz_VexRiscv_222;
  assign execute_MUL_OPB = {(execute_MulSimplePlugin_bSigned ? execute_MulSimplePlugin_b[31] : 1'b0),execute_MulSimplePlugin_b};
  assign execute_MUL_OPA = {(execute_MulSimplePlugin_aSigned ? execute_MulSimplePlugin_a[31] : 1'b0),execute_MulSimplePlugin_a};
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_VexRiscv_125;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2 = _zz_VexRiscv_136;
  assign decode_SRC1 = _zz_VexRiscv_131;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_VexRiscv_1 = _zz_VexRiscv_2;
  assign _zz_VexRiscv_3 = _zz_VexRiscv_4;
  assign decode_SHIFT_CTRL = _zz_VexRiscv_5;
  assign _zz_VexRiscv_6 = _zz_VexRiscv_7;
  assign decode_IS_RS2_SIGNED = _zz_VexRiscv_224[0];
  assign decode_IS_RS1_SIGNED = _zz_VexRiscv_225[0];
  assign decode_IS_DIV = _zz_VexRiscv_226[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_VexRiscv_227[0];
  assign decode_ALU_BITWISE_CTRL = _zz_VexRiscv_8;
  assign _zz_VexRiscv_9 = _zz_VexRiscv_10;
  assign decode_SRC_LESS_UNSIGNED = _zz_VexRiscv_228[0];
  assign _zz_VexRiscv_11 = _zz_VexRiscv_12;
  assign _zz_VexRiscv_13 = _zz_VexRiscv_14;
  assign decode_ENV_CTRL = _zz_VexRiscv_15;
  assign _zz_VexRiscv_16 = _zz_VexRiscv_17;
  assign decode_IS_CSR = _zz_VexRiscv_229[0];
  assign decode_MEMORY_STORE = _zz_VexRiscv_230[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_VexRiscv_231[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_VexRiscv_232[0];
  assign decode_ALU_CTRL = _zz_VexRiscv_18;
  assign _zz_VexRiscv_19 = _zz_VexRiscv_20;
  assign decode_MEMORY_ENABLE = _zz_VexRiscv_233[0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_VexRiscv_235);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_VexRiscv_236[0];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_VexRiscv_147;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_VexRiscv_21;
  assign decode_RS2_USE = _zz_VexRiscv_237[0];
  assign decode_RS1_USE = _zz_VexRiscv_238[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid)begin
      if(HazardSimplePlugin_addr1Match)begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(_zz_VexRiscv_178)begin
      if(_zz_VexRiscv_179)begin
        if(_zz_VexRiscv_140)begin
          decode_RS2 = _zz_VexRiscv_46;
        end
      end
    end
    if(_zz_VexRiscv_180)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_VexRiscv_142)begin
          decode_RS2 = _zz_VexRiscv_29;
        end
      end
    end
    if(_zz_VexRiscv_181)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_VexRiscv_144)begin
          decode_RS2 = _zz_VexRiscv_42;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid)begin
      if(HazardSimplePlugin_addr0Match)begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(_zz_VexRiscv_178)begin
      if(_zz_VexRiscv_179)begin
        if(_zz_VexRiscv_139)begin
          decode_RS1 = _zz_VexRiscv_46;
        end
      end
    end
    if(_zz_VexRiscv_180)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_VexRiscv_141)begin
          decode_RS1 = _zz_VexRiscv_29;
        end
      end
    end
    if(_zz_VexRiscv_181)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_VexRiscv_143)begin
          decode_RS1 = _zz_VexRiscv_42;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  assign memory_SHIFT_CTRL = _zz_VexRiscv_22;
  assign execute_SHIFT_CTRL = _zz_VexRiscv_23;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_VexRiscv_24 = decode_PC;
  assign _zz_VexRiscv_25 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_VexRiscv_26;
  assign _zz_VexRiscv_27 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_VexRiscv_28;
  assign decode_SRC_USE_SUB_LESS = _zz_VexRiscv_239[0];
  assign decode_SRC_ADD_ZERO = _zz_VexRiscv_240[0];
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  always @ (*) begin
    _zz_VexRiscv_29 = memory_REGFILE_WRITE_DATA;
    if(_zz_VexRiscv_182)begin
      _zz_VexRiscv_29 = memory_DivPlugin_div_result;
    end
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_VexRiscv_29 = _zz_VexRiscv_138;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_VexRiscv_29 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
  end

  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_MUL = memory_to_writeBack_MUL;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign memory_MUL_OPB = execute_to_memory_MUL_OPB;
  assign memory_MUL_OPA = execute_to_memory_MUL_OPA;
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_VexRiscv_30;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_VexRiscv_31;
  assign _zz_VexRiscv_32 = writeBack_INSTRUCTION;
  assign _zz_VexRiscv_33 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_VexRiscv_34 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_VexRiscv_34 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_VexRiscv_241[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_VexRiscv_306) == 32'h00001073),{(_zz_VexRiscv_307 == _zz_VexRiscv_308),{_zz_VexRiscv_309,{_zz_VexRiscv_310,_zz_VexRiscv_311}}}}}}} != 19'h0);
  always @ (*) begin
    _zz_VexRiscv_42 = execute_REGFILE_WRITE_DATA;
    if(_zz_VexRiscv_183)begin
      _zz_VexRiscv_42 = execute_CsrPlugin_readData;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_VexRiscv_43;
  assign execute_ENV_CTRL = _zz_VexRiscv_44;
  assign writeBack_ENV_CTRL = _zz_VexRiscv_45;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_VexRiscv_46 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_VexRiscv_46 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_VexRiscv_218)
        2'b00 : begin
          _zz_VexRiscv_46 = writeBack_MUL[31 : 0];
        end
        default : begin
          _zz_VexRiscv_46 = writeBack_MUL[63 : 32];
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = (((dBus_cmd_payload_size == 2'b10) && (dBus_cmd_payload_address[1 : 0] != 2'b00)) || ((dBus_cmd_payload_size == 2'b01) && (dBus_cmd_payload_address[0 : 0] != 1'b0)));
  assign decode_BRANCH_CTRL = _zz_VexRiscv_47;
  always @ (*) begin
    _zz_VexRiscv_48 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_VexRiscv_48 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_49 = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_VexRiscv_49 = IBusSimplePlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    case(_zz_VexRiscv_156)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_VexRiscv_184)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_VexRiscv_184)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_VexRiscv_98)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_VexRiscv_183)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_VexRiscv_185)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_VexRiscv_185)begin
      if(_zz_VexRiscv_186)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_VexRiscv_185)begin
      if(_zz_VexRiscv_186)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
    if(_zz_VexRiscv_155)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_VexRiscv_182)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_VexRiscv_187)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_VexRiscv_188)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_187)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_188)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_185)begin
      if(_zz_VexRiscv_186)begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_189)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_VexRiscv_187)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_VexRiscv_188)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(_zz_VexRiscv_187)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_VexRiscv_188)begin
      case(_zz_VexRiscv_190)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak)begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != 3'b000);
  assign _zz_VexRiscv_50 = {IBusSimplePlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_VexRiscv_51 = (_zz_VexRiscv_50 & (~ _zz_VexRiscv_242));
  assign _zz_VexRiscv_52 = _zz_VexRiscv_51[1];
  assign _zz_VexRiscv_53 = _zz_VexRiscv_51[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_VexRiscv_177;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_VexRiscv_244);
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @ (*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(_zz_VexRiscv_191)begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_VexRiscv_246);
  always @ (*) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if((_zz_VexRiscv_156 != 3'b000))begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_VexRiscv_54 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_VexRiscv_54);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_VexRiscv_54);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_VexRiscv_55 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_VexRiscv_55);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_VexRiscv_55);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_VexRiscv_56;
  assign _zz_VexRiscv_56 = ((1'b0 && (! _zz_VexRiscv_57)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_VexRiscv_57 = _zz_VexRiscv_58;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_VexRiscv_57;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_bufferValidPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_bufferValid : IBusSimplePlugin_decompressor_bufferValidLatch);
  assign IBusSimplePlugin_decompressor_throw2BytesPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_throw2Bytes : IBusSimplePlugin_decompressor_throw2BytesLatch);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValidPatched ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2BytesPatched ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_VexRiscv_59 = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(_zz_VexRiscv_213)
      5'h0 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_VexRiscv_59[10 : 7]},_zz_VexRiscv_59[12 : 11]},_zz_VexRiscv_59[5]},_zz_VexRiscv_59[6]},2'b00},5'h02},3'b000},_zz_VexRiscv_61},7'h13};
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_62,_zz_VexRiscv_60},3'b010},_zz_VexRiscv_61},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_62[11 : 5],_zz_VexRiscv_61},_zz_VexRiscv_60},3'b010},_zz_VexRiscv_62[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_64,_zz_VexRiscv_59[11 : 7]},3'b000},_zz_VexRiscv_59[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_67[20],_zz_VexRiscv_67[10 : 1]},_zz_VexRiscv_67[11]},_zz_VexRiscv_67[19 : 12]},_zz_VexRiscv_79},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_64,5'h0},3'b000},_zz_VexRiscv_59[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_VexRiscv_59[11 : 7] == 5'h02) ? {{{{{{{{{_zz_VexRiscv_71,_zz_VexRiscv_59[4 : 3]},_zz_VexRiscv_59[5]},_zz_VexRiscv_59[2]},_zz_VexRiscv_59[6]},4'b0000},_zz_VexRiscv_59[11 : 7]},3'b000},_zz_VexRiscv_59[11 : 7]},7'h13} : {{_zz_VexRiscv_247[31 : 12],_zz_VexRiscv_59[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_VexRiscv_59[11 : 10] == 2'b10) ? _zz_VexRiscv_85 : {{1'b0,(_zz_VexRiscv_323 || _zz_VexRiscv_324)},5'h0}),(((! _zz_VexRiscv_59[11]) || _zz_VexRiscv_81) ? _zz_VexRiscv_59[6 : 2] : _zz_VexRiscv_61)},_zz_VexRiscv_60},_zz_VexRiscv_83},_zz_VexRiscv_60},(_zz_VexRiscv_81 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_74[20],_zz_VexRiscv_74[10 : 1]},_zz_VexRiscv_74[11]},_zz_VexRiscv_74[19 : 12]},_zz_VexRiscv_78},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_VexRiscv_77[12],_zz_VexRiscv_77[10 : 5]},_zz_VexRiscv_78},_zz_VexRiscv_60},3'b000},_zz_VexRiscv_77[4 : 1]},_zz_VexRiscv_77[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_VexRiscv_77[12],_zz_VexRiscv_77[10 : 5]},_zz_VexRiscv_78},_zz_VexRiscv_60},3'b001},_zz_VexRiscv_77[4 : 1]},_zz_VexRiscv_77[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_VexRiscv_59[6 : 2]},_zz_VexRiscv_59[11 : 7]},3'b001},_zz_VexRiscv_59[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_VexRiscv_59[3 : 2]},_zz_VexRiscv_59[12]},_zz_VexRiscv_59[6 : 4]},2'b00},_zz_VexRiscv_80},3'b010},_zz_VexRiscv_59[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_VexRiscv_59[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_VexRiscv_59[6 : 2] == 5'h0) ? {{{{12'h0,_zz_VexRiscv_59[11 : 7]},3'b000},(_zz_VexRiscv_59[12] ? _zz_VexRiscv_79 : _zz_VexRiscv_78)},7'h67} : {{{{{_zz_VexRiscv_325,_zz_VexRiscv_326},(_zz_VexRiscv_327 ? _zz_VexRiscv_328 : _zz_VexRiscv_78)},3'b000},_zz_VexRiscv_59[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_248[11 : 5],_zz_VexRiscv_59[6 : 2]},_zz_VexRiscv_80},3'b010},_zz_VexRiscv_249[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_VexRiscv_60 = {2'b01,_zz_VexRiscv_59[9 : 7]};
  assign _zz_VexRiscv_61 = {2'b01,_zz_VexRiscv_59[4 : 2]};
  assign _zz_VexRiscv_62 = {{{{5'h0,_zz_VexRiscv_59[5]},_zz_VexRiscv_59[12 : 10]},_zz_VexRiscv_59[6]},2'b00};
  assign _zz_VexRiscv_63 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_64[11] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[10] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[9] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[8] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[7] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[6] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[5] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[4 : 0] = _zz_VexRiscv_59[6 : 2];
  end

  assign _zz_VexRiscv_65 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_66[9] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[8] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[7] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[6] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[5] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[4] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[3] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[2] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[1] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[0] = _zz_VexRiscv_65;
  end

  assign _zz_VexRiscv_67 = {{{{{{{{_zz_VexRiscv_66,_zz_VexRiscv_59[8]},_zz_VexRiscv_59[10 : 9]},_zz_VexRiscv_59[6]},_zz_VexRiscv_59[7]},_zz_VexRiscv_59[2]},_zz_VexRiscv_59[11]},_zz_VexRiscv_59[5 : 3]},1'b0};
  assign _zz_VexRiscv_68 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_69[14] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[13] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[12] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[11] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[10] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[9] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[8] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[7] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[6] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[5] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[4] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[3] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[2] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[1] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[0] = _zz_VexRiscv_68;
  end

  assign _zz_VexRiscv_70 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_71[2] = _zz_VexRiscv_70;
    _zz_VexRiscv_71[1] = _zz_VexRiscv_70;
    _zz_VexRiscv_71[0] = _zz_VexRiscv_70;
  end

  assign _zz_VexRiscv_72 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_73[9] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[8] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[7] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[6] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[5] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[4] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[3] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[2] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[1] = _zz_VexRiscv_72;
    _zz_VexRiscv_73[0] = _zz_VexRiscv_72;
  end

  assign _zz_VexRiscv_74 = {{{{{{{{_zz_VexRiscv_73,_zz_VexRiscv_59[8]},_zz_VexRiscv_59[10 : 9]},_zz_VexRiscv_59[6]},_zz_VexRiscv_59[7]},_zz_VexRiscv_59[2]},_zz_VexRiscv_59[11]},_zz_VexRiscv_59[5 : 3]},1'b0};
  assign _zz_VexRiscv_75 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_76[4] = _zz_VexRiscv_75;
    _zz_VexRiscv_76[3] = _zz_VexRiscv_75;
    _zz_VexRiscv_76[2] = _zz_VexRiscv_75;
    _zz_VexRiscv_76[1] = _zz_VexRiscv_75;
    _zz_VexRiscv_76[0] = _zz_VexRiscv_75;
  end

  assign _zz_VexRiscv_77 = {{{{{_zz_VexRiscv_76,_zz_VexRiscv_59[6 : 5]},_zz_VexRiscv_59[2]},_zz_VexRiscv_59[11 : 10]},_zz_VexRiscv_59[4 : 3]},1'b0};
  assign _zz_VexRiscv_78 = 5'h0;
  assign _zz_VexRiscv_79 = 5'h01;
  assign _zz_VexRiscv_80 = 5'h02;
  assign _zz_VexRiscv_81 = (_zz_VexRiscv_59[11 : 10] != 2'b11);
  always @ (*) begin
    case(_zz_VexRiscv_214)
      2'b00 : begin
        _zz_VexRiscv_82 = 3'b000;
      end
      2'b01 : begin
        _zz_VexRiscv_82 = 3'b100;
      end
      2'b10 : begin
        _zz_VexRiscv_82 = 3'b110;
      end
      default : begin
        _zz_VexRiscv_82 = 3'b111;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_VexRiscv_215)
      2'b00 : begin
        _zz_VexRiscv_83 = 3'b101;
      end
      2'b01 : begin
        _zz_VexRiscv_83 = 3'b101;
      end
      2'b10 : begin
        _zz_VexRiscv_83 = 3'b111;
      end
      default : begin
        _zz_VexRiscv_83 = _zz_VexRiscv_82;
      end
    endcase
  end

  assign _zz_VexRiscv_84 = _zz_VexRiscv_59[12];
  always @ (*) begin
    _zz_VexRiscv_85[6] = _zz_VexRiscv_84;
    _zz_VexRiscv_85[5] = _zz_VexRiscv_84;
    _zz_VexRiscv_85[4] = _zz_VexRiscv_84;
    _zz_VexRiscv_85[3] = _zz_VexRiscv_84;
    _zz_VexRiscv_85[2] = _zz_VexRiscv_84;
    _zz_VexRiscv_85[1] = _zz_VexRiscv_84;
    _zz_VexRiscv_85[0] = _zz_VexRiscv_84;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_1_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_VexRiscv_86;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_VexRiscv_87;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_VexRiscv_88;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_VexRiscv_89;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_VexRiscv_90;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(_zz_VexRiscv_156)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _zz_VexRiscv_91 = _zz_VexRiscv_250[11];
  always @ (*) begin
    _zz_VexRiscv_92[18] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[17] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[16] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[15] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[14] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[13] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[12] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[11] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[10] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[9] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[8] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[7] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[6] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[5] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[4] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[3] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[2] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[1] = _zz_VexRiscv_91;
    _zz_VexRiscv_92[0] = _zz_VexRiscv_91;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_VexRiscv_251[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_VexRiscv_93 = _zz_VexRiscv_252[19];
  always @ (*) begin
    _zz_VexRiscv_94[10] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[9] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[8] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[7] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[6] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[5] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[4] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[3] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[2] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[1] = _zz_VexRiscv_93;
    _zz_VexRiscv_94[0] = _zz_VexRiscv_93;
  end

  assign _zz_VexRiscv_95 = _zz_VexRiscv_253[11];
  always @ (*) begin
    _zz_VexRiscv_96[18] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[17] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[16] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[15] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[14] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[13] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[12] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[11] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[10] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[9] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[8] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[7] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[6] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[5] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[4] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[3] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[2] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[1] = _zz_VexRiscv_95;
    _zz_VexRiscv_96[0] = _zz_VexRiscv_95;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_VexRiscv_94,{{{_zz_VexRiscv_329,_zz_VexRiscv_330},_zz_VexRiscv_331},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_VexRiscv_96,{{{_zz_VexRiscv_332,_zz_VexRiscv_333},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_VexRiscv_254 - _zz_VexRiscv_258);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_VexRiscv_173 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_VexRiscv_173);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
    if(_zz_VexRiscv_192)begin
      IBusSimplePlugin_rspJoin_exceptionDetected = 1'b1;
    end
  end

  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_VexRiscv_97 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_VexRiscv_97);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_VexRiscv_97);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  always @ (*) begin
    IBusSimplePlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_VexRiscv_192)begin
      IBusSimplePlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusSimplePlugin_decodeExceptionPort_payload_badAddr = {IBusSimplePlugin_rspJoin_join_payload_pc[31 : 2],2'b00};
  assign IBusSimplePlugin_decodeExceptionPort_valid = (IBusSimplePlugin_rspJoin_exceptionDetected && IBusSimplePlugin_iBusRsp_readyForError);
  assign _zz_VexRiscv_98 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_VexRiscv_98));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_VexRiscv_99 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_VexRiscv_99 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_VexRiscv_99 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_VexRiscv_99;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_VexRiscv_100 = 4'b0001;
      end
      2'b01 : begin
        _zz_VexRiscv_100 = 4'b0011;
      end
      default : begin
        _zz_VexRiscv_100 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_VexRiscv_100 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(_zz_VexRiscv_193)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if((! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers)))))begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(_zz_VexRiscv_193)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_VexRiscv_263};
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_VexRiscv_101 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_VexRiscv_102[31] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[30] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[29] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[28] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[27] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[26] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[25] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[24] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[23] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[22] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[21] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[20] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[19] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[18] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[17] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[16] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[15] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[14] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[13] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[12] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[11] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[10] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[9] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[8] = _zz_VexRiscv_101;
    _zz_VexRiscv_102[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_VexRiscv_103 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_VexRiscv_104[31] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[30] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[29] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[28] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[27] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[26] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[25] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[24] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[23] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[22] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[21] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[20] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[19] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[18] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[17] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[16] = _zz_VexRiscv_103;
    _zz_VexRiscv_104[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_VexRiscv_216)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_VexRiscv_102;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_VexRiscv_104;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_VexRiscv_105 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_VexRiscv_106 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_VexRiscv_107 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_VexRiscv_108 = {decodeExceptionPort_valid,IBusSimplePlugin_decodeExceptionPort_valid};
  assign _zz_VexRiscv_109 = _zz_VexRiscv_264[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_VexRiscv_184)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2944)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2818)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2946)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3072)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3074)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3202)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_VexRiscv_194)begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(_zz_VexRiscv_195)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_VexRiscv_196)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_VexRiscv_197)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_VexRiscv_195)begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(_zz_VexRiscv_196)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
    if(_zz_VexRiscv_197)begin
      CsrPlugin_selfException_payload_code = 4'b0011;
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_VexRiscv_194)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_VexRiscv_194)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_VexRiscv_217)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_111 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_VexRiscv_112 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_VexRiscv_113 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_VexRiscv_114 = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_VexRiscv_115 = ((decode_INSTRUCTION & 32'h00103050) == 32'h00100050);
  assign _zz_VexRiscv_116 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_VexRiscv_110 = {({_zz_VexRiscv_113,(_zz_VexRiscv_334 == _zz_VexRiscv_335)} != 2'b00),{((_zz_VexRiscv_336 == _zz_VexRiscv_337) != 1'b0),{({_zz_VexRiscv_338,_zz_VexRiscv_339} != 2'b00),{(_zz_VexRiscv_340 != _zz_VexRiscv_341),{_zz_VexRiscv_342,{_zz_VexRiscv_343,_zz_VexRiscv_344}}}}}};
  assign _zz_VexRiscv_117 = _zz_VexRiscv_110[1 : 0];
  assign _zz_VexRiscv_41 = _zz_VexRiscv_117;
  assign _zz_VexRiscv_118 = _zz_VexRiscv_110[6 : 5];
  assign _zz_VexRiscv_40 = _zz_VexRiscv_118;
  assign _zz_VexRiscv_119 = _zz_VexRiscv_110[8 : 7];
  assign _zz_VexRiscv_39 = _zz_VexRiscv_119;
  assign _zz_VexRiscv_120 = _zz_VexRiscv_110[17 : 16];
  assign _zz_VexRiscv_38 = _zz_VexRiscv_120;
  assign _zz_VexRiscv_121 = _zz_VexRiscv_110[21 : 20];
  assign _zz_VexRiscv_37 = _zz_VexRiscv_121;
  assign _zz_VexRiscv_122 = _zz_VexRiscv_110[28 : 27];
  assign _zz_VexRiscv_36 = _zz_VexRiscv_122;
  assign _zz_VexRiscv_123 = _zz_VexRiscv_110[30 : 29];
  assign _zz_VexRiscv_35 = _zz_VexRiscv_123;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_VexRiscv_175;
  assign decode_RegFilePlugin_rs2Data = _zz_VexRiscv_176;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_VexRiscv_33 && writeBack_arbitration_isFiring);
    if(_zz_VexRiscv_124)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_VexRiscv_32[11 : 7];
    if(_zz_VexRiscv_124)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_VexRiscv_46;
    if(_zz_VexRiscv_124)begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_VexRiscv_125 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_VexRiscv_125 = {31'd0, _zz_VexRiscv_266};
      end
      default : begin
        _zz_VexRiscv_125 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign execute_MulSimplePlugin_a = execute_SRC1;
  assign execute_MulSimplePlugin_b = execute_SRC2;
  always @ (*) begin
    case(_zz_VexRiscv_198)
      2'b01 : begin
        execute_MulSimplePlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulSimplePlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulSimplePlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_VexRiscv_198)
      2'b01 : begin
        execute_MulSimplePlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulSimplePlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulSimplePlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_VexRiscv_182)begin
      if(_zz_VexRiscv_199)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_VexRiscv_200)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_VexRiscv_268);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_VexRiscv_126 = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_VexRiscv_126[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_VexRiscv_269);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_VexRiscv_270 : _zz_VexRiscv_271);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_VexRiscv_272[31:0];
  assign _zz_VexRiscv_127 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_VexRiscv_128 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_VexRiscv_129 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_VexRiscv_130[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_VexRiscv_130[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_VexRiscv_131 = _zz_VexRiscv_27;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_VexRiscv_131 = {29'd0, _zz_VexRiscv_282};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_VexRiscv_131 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_VexRiscv_131 = {27'd0, _zz_VexRiscv_283};
      end
    endcase
  end

  assign _zz_VexRiscv_132 = _zz_VexRiscv_284[11];
  always @ (*) begin
    _zz_VexRiscv_133[19] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[18] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[17] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[16] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[15] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[14] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[13] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[12] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[11] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[10] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[9] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[8] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[7] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[6] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[5] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[4] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[3] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[2] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[1] = _zz_VexRiscv_132;
    _zz_VexRiscv_133[0] = _zz_VexRiscv_132;
  end

  assign _zz_VexRiscv_134 = _zz_VexRiscv_285[11];
  always @ (*) begin
    _zz_VexRiscv_135[19] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[18] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[17] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[16] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[15] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[14] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[13] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[12] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[11] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[10] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[9] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[8] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[7] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[6] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[5] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[4] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[3] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[2] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[1] = _zz_VexRiscv_134;
    _zz_VexRiscv_135[0] = _zz_VexRiscv_134;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_VexRiscv_136 = _zz_VexRiscv_25;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_VexRiscv_136 = {_zz_VexRiscv_133,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_VexRiscv_136 = {_zz_VexRiscv_135,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_VexRiscv_136 = _zz_VexRiscv_24;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_VexRiscv_286;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_VexRiscv_137[0] = execute_SRC1[31];
    _zz_VexRiscv_137[1] = execute_SRC1[30];
    _zz_VexRiscv_137[2] = execute_SRC1[29];
    _zz_VexRiscv_137[3] = execute_SRC1[28];
    _zz_VexRiscv_137[4] = execute_SRC1[27];
    _zz_VexRiscv_137[5] = execute_SRC1[26];
    _zz_VexRiscv_137[6] = execute_SRC1[25];
    _zz_VexRiscv_137[7] = execute_SRC1[24];
    _zz_VexRiscv_137[8] = execute_SRC1[23];
    _zz_VexRiscv_137[9] = execute_SRC1[22];
    _zz_VexRiscv_137[10] = execute_SRC1[21];
    _zz_VexRiscv_137[11] = execute_SRC1[20];
    _zz_VexRiscv_137[12] = execute_SRC1[19];
    _zz_VexRiscv_137[13] = execute_SRC1[18];
    _zz_VexRiscv_137[14] = execute_SRC1[17];
    _zz_VexRiscv_137[15] = execute_SRC1[16];
    _zz_VexRiscv_137[16] = execute_SRC1[15];
    _zz_VexRiscv_137[17] = execute_SRC1[14];
    _zz_VexRiscv_137[18] = execute_SRC1[13];
    _zz_VexRiscv_137[19] = execute_SRC1[12];
    _zz_VexRiscv_137[20] = execute_SRC1[11];
    _zz_VexRiscv_137[21] = execute_SRC1[10];
    _zz_VexRiscv_137[22] = execute_SRC1[9];
    _zz_VexRiscv_137[23] = execute_SRC1[8];
    _zz_VexRiscv_137[24] = execute_SRC1[7];
    _zz_VexRiscv_137[25] = execute_SRC1[6];
    _zz_VexRiscv_137[26] = execute_SRC1[5];
    _zz_VexRiscv_137[27] = execute_SRC1[4];
    _zz_VexRiscv_137[28] = execute_SRC1[3];
    _zz_VexRiscv_137[29] = execute_SRC1[2];
    _zz_VexRiscv_137[30] = execute_SRC1[1];
    _zz_VexRiscv_137[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_VexRiscv_137 : execute_SRC1);
  always @ (*) begin
    _zz_VexRiscv_138[0] = memory_SHIFT_RIGHT[31];
    _zz_VexRiscv_138[1] = memory_SHIFT_RIGHT[30];
    _zz_VexRiscv_138[2] = memory_SHIFT_RIGHT[29];
    _zz_VexRiscv_138[3] = memory_SHIFT_RIGHT[28];
    _zz_VexRiscv_138[4] = memory_SHIFT_RIGHT[27];
    _zz_VexRiscv_138[5] = memory_SHIFT_RIGHT[26];
    _zz_VexRiscv_138[6] = memory_SHIFT_RIGHT[25];
    _zz_VexRiscv_138[7] = memory_SHIFT_RIGHT[24];
    _zz_VexRiscv_138[8] = memory_SHIFT_RIGHT[23];
    _zz_VexRiscv_138[9] = memory_SHIFT_RIGHT[22];
    _zz_VexRiscv_138[10] = memory_SHIFT_RIGHT[21];
    _zz_VexRiscv_138[11] = memory_SHIFT_RIGHT[20];
    _zz_VexRiscv_138[12] = memory_SHIFT_RIGHT[19];
    _zz_VexRiscv_138[13] = memory_SHIFT_RIGHT[18];
    _zz_VexRiscv_138[14] = memory_SHIFT_RIGHT[17];
    _zz_VexRiscv_138[15] = memory_SHIFT_RIGHT[16];
    _zz_VexRiscv_138[16] = memory_SHIFT_RIGHT[15];
    _zz_VexRiscv_138[17] = memory_SHIFT_RIGHT[14];
    _zz_VexRiscv_138[18] = memory_SHIFT_RIGHT[13];
    _zz_VexRiscv_138[19] = memory_SHIFT_RIGHT[12];
    _zz_VexRiscv_138[20] = memory_SHIFT_RIGHT[11];
    _zz_VexRiscv_138[21] = memory_SHIFT_RIGHT[10];
    _zz_VexRiscv_138[22] = memory_SHIFT_RIGHT[9];
    _zz_VexRiscv_138[23] = memory_SHIFT_RIGHT[8];
    _zz_VexRiscv_138[24] = memory_SHIFT_RIGHT[7];
    _zz_VexRiscv_138[25] = memory_SHIFT_RIGHT[6];
    _zz_VexRiscv_138[26] = memory_SHIFT_RIGHT[5];
    _zz_VexRiscv_138[27] = memory_SHIFT_RIGHT[4];
    _zz_VexRiscv_138[28] = memory_SHIFT_RIGHT[3];
    _zz_VexRiscv_138[29] = memory_SHIFT_RIGHT[2];
    _zz_VexRiscv_138[30] = memory_SHIFT_RIGHT[1];
    _zz_VexRiscv_138[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(_zz_VexRiscv_201)begin
      if(_zz_VexRiscv_202)begin
        if(_zz_VexRiscv_139)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_203)begin
      if(_zz_VexRiscv_204)begin
        if(_zz_VexRiscv_141)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_205)begin
      if(_zz_VexRiscv_206)begin
        if(_zz_VexRiscv_143)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @ (*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(_zz_VexRiscv_201)begin
      if(_zz_VexRiscv_202)begin
        if(_zz_VexRiscv_140)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_203)begin
      if(_zz_VexRiscv_204)begin
        if(_zz_VexRiscv_142)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_205)begin
      if(_zz_VexRiscv_206)begin
        if(_zz_VexRiscv_144)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_VexRiscv_33 && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_VexRiscv_32[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_VexRiscv_46;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_139 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_140 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_141 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_142 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_143 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_144 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_VexRiscv_145 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_VexRiscv_145 == 3'b000)) begin
        _zz_VexRiscv_146 = execute_BranchPlugin_eq;
    end else if((_zz_VexRiscv_145 == 3'b001)) begin
        _zz_VexRiscv_146 = (! execute_BranchPlugin_eq);
    end else if((((_zz_VexRiscv_145 & 3'b101) == 3'b101))) begin
        _zz_VexRiscv_146 = (! execute_SRC_LESS);
    end else begin
        _zz_VexRiscv_146 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_VexRiscv_147 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_VexRiscv_147 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_VexRiscv_147 = 1'b1;
      end
      default : begin
        _zz_VexRiscv_147 = _zz_VexRiscv_146;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_VexRiscv_148 = _zz_VexRiscv_293[11];
  always @ (*) begin
    _zz_VexRiscv_149[19] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[18] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[17] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[16] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[15] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[14] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[13] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[12] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[11] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[10] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[9] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[8] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[7] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[6] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[5] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[4] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[3] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[2] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[1] = _zz_VexRiscv_148;
    _zz_VexRiscv_149[0] = _zz_VexRiscv_148;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_VexRiscv_149,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_VexRiscv_151,{{{_zz_VexRiscv_469,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_VexRiscv_153,{{{_zz_VexRiscv_470,_zz_VexRiscv_471},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_VexRiscv_296};
        end
      end
    endcase
  end

  assign _zz_VexRiscv_150 = _zz_VexRiscv_294[19];
  always @ (*) begin
    _zz_VexRiscv_151[10] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[9] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[8] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[7] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[6] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[5] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[4] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[3] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[2] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[1] = _zz_VexRiscv_150;
    _zz_VexRiscv_151[0] = _zz_VexRiscv_150;
  end

  assign _zz_VexRiscv_152 = _zz_VexRiscv_295[11];
  always @ (*) begin
    _zz_VexRiscv_153[18] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[17] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[16] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[15] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[14] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[13] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[12] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[11] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[10] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[9] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[8] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[7] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[6] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[5] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[4] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[3] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[2] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[1] = _zz_VexRiscv_152;
    _zz_VexRiscv_153[0] = _zz_VexRiscv_152;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_VexRiscv_207)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_VexRiscv_154))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_VexRiscv_207)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_VexRiscv_28 = _zz_VexRiscv_41;
  assign _zz_VexRiscv_20 = decode_ALU_CTRL;
  assign _zz_VexRiscv_18 = _zz_VexRiscv_40;
  assign _zz_VexRiscv_30 = decode_to_execute_ALU_CTRL;
  assign _zz_VexRiscv_26 = _zz_VexRiscv_39;
  assign _zz_VexRiscv_17 = decode_ENV_CTRL;
  assign _zz_VexRiscv_14 = execute_ENV_CTRL;
  assign _zz_VexRiscv_12 = memory_ENV_CTRL;
  assign _zz_VexRiscv_15 = _zz_VexRiscv_38;
  assign _zz_VexRiscv_44 = decode_to_execute_ENV_CTRL;
  assign _zz_VexRiscv_43 = execute_to_memory_ENV_CTRL;
  assign _zz_VexRiscv_45 = memory_to_writeBack_ENV_CTRL;
  assign _zz_VexRiscv_10 = decode_ALU_BITWISE_CTRL;
  assign _zz_VexRiscv_8 = _zz_VexRiscv_37;
  assign _zz_VexRiscv_31 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_VexRiscv_7 = decode_SHIFT_CTRL;
  assign _zz_VexRiscv_4 = execute_SHIFT_CTRL;
  assign _zz_VexRiscv_5 = _zz_VexRiscv_36;
  assign _zz_VexRiscv_23 = decode_to_execute_SHIFT_CTRL;
  assign _zz_VexRiscv_22 = execute_to_memory_SHIFT_CTRL;
  assign _zz_VexRiscv_2 = decode_BRANCH_CTRL;
  assign _zz_VexRiscv_47 = _zz_VexRiscv_35;
  assign _zz_VexRiscv_21 = decode_to_execute_BRANCH_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_VexRiscv_156)
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_VexRiscv_157 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_VexRiscv_157[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_VexRiscv_157[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_VexRiscv_157[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_158 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_VexRiscv_158[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_VexRiscv_158[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_VexRiscv_158[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_159 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_VexRiscv_159[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_VexRiscv_159[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_VexRiscv_159[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_160 = 32'h0;
    if(execute_CsrPlugin_csr_773)begin
      _zz_VexRiscv_160[31 : 2] = CsrPlugin_mtvec_base;
      _zz_VexRiscv_160[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_161 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_VexRiscv_161[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_162 = 32'h0;
    if(execute_CsrPlugin_csr_832)begin
      _zz_VexRiscv_162[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_163 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_VexRiscv_163[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_VexRiscv_163[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_164 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_VexRiscv_164[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_165 = 32'h0;
    if(execute_CsrPlugin_csr_2816)begin
      _zz_VexRiscv_165[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_166 = 32'h0;
    if(execute_CsrPlugin_csr_2944)begin
      _zz_VexRiscv_166[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_167 = 32'h0;
    if(execute_CsrPlugin_csr_2818)begin
      _zz_VexRiscv_167[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_168 = 32'h0;
    if(execute_CsrPlugin_csr_2946)begin
      _zz_VexRiscv_168[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_169 = 32'h0;
    if(execute_CsrPlugin_csr_3072)begin
      _zz_VexRiscv_169[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_170 = 32'h0;
    if(execute_CsrPlugin_csr_3200)begin
      _zz_VexRiscv_170[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_171 = 32'h0;
    if(execute_CsrPlugin_csr_3074)begin
      _zz_VexRiscv_171[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_172 = 32'h0;
    if(execute_CsrPlugin_csr_3202)begin
      _zz_VexRiscv_172[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  assign execute_CsrPlugin_readData = ((((_zz_VexRiscv_157 | _zz_VexRiscv_158) | (_zz_VexRiscv_159 | _zz_VexRiscv_160)) | ((_zz_VexRiscv_161 | _zz_VexRiscv_162) | (_zz_VexRiscv_163 | _zz_VexRiscv_164))) | (((_zz_VexRiscv_165 | _zz_VexRiscv_166) | (_zz_VexRiscv_167 | _zz_VexRiscv_168)) | ((_zz_VexRiscv_169 | _zz_VexRiscv_170) | (_zz_VexRiscv_171 | _zz_VexRiscv_172))));
  assign _zz_VexRiscv_174 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h0;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'h0;
      _zz_VexRiscv_58 <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_VexRiscv_86 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      CsrPlugin_mtvec_mode <= 2'b00;
      CsrPlugin_mtvec_base <= 30'h00000008;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_VexRiscv_124 <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      _zz_VexRiscv_155 <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_VexRiscv_156 <= 3'b000;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(_zz_VexRiscv_191)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_VexRiscv_58 <= 1'b0;
      end
      if(_zz_VexRiscv_56)begin
        _zz_VexRiscv_58 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if((IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if((IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_VexRiscv_208)begin
        if(IBusSimplePlugin_decompressor_bufferFill)begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        _zz_VexRiscv_86 <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready)begin
        _zz_VexRiscv_86 <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_VexRiscv_260);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_VexRiscv_262);
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)));
        `else
          if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_VexRiscv_209)begin
        if(_zz_VexRiscv_210)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_VexRiscv_211)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_VexRiscv_212)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_VexRiscv_187)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_VexRiscv_188)begin
        case(_zz_VexRiscv_190)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_VexRiscv_107,{_zz_VexRiscv_106,_zz_VexRiscv_105}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_VexRiscv_124 <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_VexRiscv_207)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[18])begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[26])begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_VexRiscv_185)begin
        if(_zz_VexRiscv_186)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_VexRiscv_189)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_VexRiscv_155 <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(_zz_VexRiscv_156)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_VexRiscv_156 <= 3'b001;
          end
        end
        3'b001 : begin
          _zz_VexRiscv_156 <= 3'b010;
        end
        3'b010 : begin
          _zz_VexRiscv_156 <= 3'b011;
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_VexRiscv_156 <= 3'b100;
          end
        end
        3'b100 : begin
          _zz_VexRiscv_156 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_VexRiscv_297[0];
          CsrPlugin_mstatus_MIE <= _zz_VexRiscv_298[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_VexRiscv_300[0];
          CsrPlugin_mie_MTIE <= _zz_VexRiscv_301[0];
          CsrPlugin_mie_MSIE <= _zz_VexRiscv_302[0];
        end
      end
      if(execute_CsrPlugin_csr_773)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusSimplePlugin_decompressor_input_valid)begin
      IBusSimplePlugin_decompressor_bufferValidLatch <= IBusSimplePlugin_decompressor_bufferValid;
    end
    if(IBusSimplePlugin_decompressor_input_valid)begin
      IBusSimplePlugin_decompressor_throw2BytesLatch <= IBusSimplePlugin_decompressor_throw2Bytes;
    end
    if(_zz_VexRiscv_208)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready)begin
      _zz_VexRiscv_87 <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_VexRiscv_88 <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_VexRiscv_89 <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_VexRiscv_90 <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_VexRiscv_184)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_VexRiscv_109 ? IBusSimplePlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_VexRiscv_109 ? IBusSimplePlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusSimplePlugin_memoryExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
    end
    if(_zz_VexRiscv_209)begin
      if(_zz_VexRiscv_210)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_VexRiscv_211)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_VexRiscv_212)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_VexRiscv_187)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_VexRiscv_182)begin
      if(_zz_VexRiscv_199)begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_VexRiscv_273[31:0];
        end
      end
    end
    if(_zz_VexRiscv_200)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_VexRiscv_129 ? (~ _zz_VexRiscv_130) : _zz_VexRiscv_130) + _zz_VexRiscv_279);
      memory_DivPlugin_rs2 <= ((_zz_VexRiscv_128 ? (~ execute_RS2) : execute_RS2) + _zz_VexRiscv_281);
      memory_DivPlugin_div_needRevert <= ((_zz_VexRiscv_129 ^ (_zz_VexRiscv_128 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_VexRiscv_46;
    end
    _zz_VexRiscv_154 <= debug_bus_cmd_payload_address[2];
    if(_zz_VexRiscv_185)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_VexRiscv_24;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_VexRiscv_49;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_VexRiscv_48;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_VexRiscv_19;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_VexRiscv_16;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_VexRiscv_13;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_VexRiscv_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_VexRiscv_9;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_VexRiscv_6;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_VexRiscv_3;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_VexRiscv_1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_VexRiscv_27;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_VexRiscv_25;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_VexRiscv_42;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_VexRiscv_29;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_OPA <= execute_MUL_OPA;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_OPB <= execute_MUL_OPB;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL <= memory_MUL;
    end
    if((_zz_VexRiscv_156 != 3'b000))begin
      _zz_VexRiscv_89 <= IBusSimplePlugin_injectionPort_payload;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2818 <= (decode_INSTRUCTION[31 : 20] == 12'hb02);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2946 <= (decode_INSTRUCTION[31 : 20] == 12'hb82);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3074 <= (decode_INSTRUCTION[31 : 20] == 12'hc02);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3202 <= (decode_INSTRUCTION[31 : 20] == 12'hc82);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_VexRiscv_299[0];
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_832)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end


endmodule

module FlowCCByToggle (
  input               io_input_valid,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment,
  output              io_output_valid,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment,
  input               io_jtag_tck,
  input               clk,
  input               reset
);
  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target = 0;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_regNext_valid;
  reg                 outputArea_flow_regNext_payload_last;
  reg        [0:0]    outputArea_flow_regNext_payload_fragment;

  BufferCC inputArea_target_buffercc (
    .io_dataIn     (inputArea_target                      ), //i
    .io_dataOut    (inputArea_target_buffercc_io_dataOut  ), //o
    .clk           (clk                                   ), //i
    .reset         (reset                                 )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_regNext_valid;
  assign io_output_payload_last = outputArea_flow_regNext_payload_last;
  assign io_output_payload_fragment = outputArea_flow_regNext_payload_fragment;
  always @ (posedge io_jtag_tck) begin
    if(io_input_valid)begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @ (posedge clk) begin
    outputArea_hit <= outputArea_target;
    outputArea_flow_regNext_payload_last <= outputArea_flow_payload_last;
    outputArea_flow_regNext_payload_fragment <= outputArea_flow_payload_fragment;
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      outputArea_flow_regNext_valid <= 1'b0;
    end else begin
      outputArea_flow_regNext_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire                _zz_StreamFifoLowLatency_4;
  wire       [0:0]    _zz_StreamFifoLowLatency_5;
  reg                 _zz_StreamFifoLowLatency_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_StreamFifoLowLatency_2;
  reg        [32:0]   _zz_StreamFifoLowLatency_3;

  assign _zz_StreamFifoLowLatency_4 = (! empty);
  assign _zz_StreamFifoLowLatency_5 = _zz_StreamFifoLowLatency_2[0 : 0];
  always @ (*) begin
    _zz_StreamFifoLowLatency_1 = 1'b0;
    if(pushing)begin
      _zz_StreamFifoLowLatency_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_StreamFifoLowLatency_2 = _zz_StreamFifoLowLatency_3;
  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4)begin
      io_pop_payload_error = _zz_StreamFifoLowLatency_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4)begin
      io_pop_payload_inst = _zz_StreamFifoLowLatency_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_StreamFifoLowLatency_1)begin
      _zz_StreamFifoLowLatency_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
