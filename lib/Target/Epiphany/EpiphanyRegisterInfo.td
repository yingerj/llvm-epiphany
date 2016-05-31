//===-- EpiphanyRegisterInfo.td - Epiphany Register defs ---*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the Epiphany register file
//===----------------------------------------------------------------------===//

class EpiphanyReg<bits<16> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "EP";
}

class EpiphanyCtrlReg<bits<16> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "EP";
}

let Namespace = "EP" in {
def sub_even : SubRegIndex<32>;
def sub_odd  : SubRegIndex<32, 32>;
}

// Ri - 32-bit integer registers
class Ri<bits<16> Enc, string n> : EpiphanyReg<Enc, n>;

// Rdi - pairs of 32-bit integer registers
class Rdi<bits<16> Enc, string n, list<Register> subregs> : EpiphanyReg<Enc, n> {
  let SubRegs = subregs;
  let SubRegIndices = [sub_even, sub_odd];
  let CoveredBySubRegs = 1;
}
// Rf - 32-bit floating-point registers
class Rf<bits<16> Enc, string n> : EpiphanyReg<Enc, n>;

//===----------------------------------------------------------------------===//
// General Purpose Registers
//===----------------------------------------------------------------------===//

// General Purpose Word Integer Registers
foreach I = 0-63 in
  def W#I : Ri<I, "R"#I>;


// General Purpose Double Word Integer Registers
// TODO: Make this work instead of the long generated list below:
//foreach I = 0-31 in
//  def D#I : Rdi<!shl(I, 1), "R"#!shl(1, I), [W#!shl(1, I), W#!add(!shl(1, I), 1)]>;

def D0 : Rdi<0, "R0", [W0, W1]>;
def D1 : Rdi<2, "R2", [W2, W3]>;
def D2 : Rdi<4, "R4", [W4, W5]>;
def D3 : Rdi<6, "R6", [W6, W7]>;
def D4 : Rdi<8, "R8", [W8, W9]>;
def D5 : Rdi<10, "R10", [W10, W11]>;
def D6 : Rdi<12, "R12", [W12, W13]>;
def D7 : Rdi<14, "R14", [W14, W15]>;
def D8 : Rdi<16, "R16", [W16, W17]>;
def D9 : Rdi<18, "R18", [W18, W19]>;
def D10 : Rdi<20, "R20", [W20, W21]>;
def D11 : Rdi<22, "R22", [W22, W23]>;
def D12 : Rdi<24, "R24", [W24, W25]>;
def D13 : Rdi<26, "R26", [W26, W27]>;
def D14 : Rdi<28, "R28", [W28, W29]>;
def D15 : Rdi<30, "R30", [W30, W31]>;
def D16 : Rdi<32, "R32", [W32, W33]>;
def D17 : Rdi<34, "R34", [W34, W35]>;
def D18 : Rdi<36, "R36", [W36, W37]>;
def D19 : Rdi<38, "R38", [W38, W39]>;
def D20 : Rdi<40, "R40", [W40, W41]>;
def D21 : Rdi<42, "R42", [W42, W43]>;
def D22 : Rdi<44, "R44", [W44, W45]>;
def D23 : Rdi<46, "R46", [W46, W47]>;
def D24 : Rdi<48, "R48", [W48, W49]>;
def D25 : Rdi<50, "R50", [W50, W51]>;
def D26 : Rdi<52, "R52", [W52, W53]>;
def D27 : Rdi<54, "R54", [W54, W55]>;
def D28 : Rdi<56, "R56", [W56, W57]>;
def D29 : Rdi<58, "R58", [W58, W59]>;
def D30 : Rdi<60, "R60", [W60, W61]>;
def D31 : Rdi<62, "R62", [W62, W63]>;


// General Purpose Word Floating Point Registers
foreach I = 0-63 in
  def F#I : Ri<I, "R"#I>;

//===----------------------------------------------------------------------===//
// Control Registers
//===----------------------------------------------------------------------===//

def CONF : EpiphanyCtrlReg<0, "CONF">;
def STAT : EpiphanyCtrlReg<1, "STAT">;
def PC : EpiphanyCtrlReg<2, "PC">;

//===----------------------------------------------------------------------===//
// Register Classes
//===----------------------------------------------------------------------===//

def IWRegs : RegisterClass<"EP", [i32], 32,
                            (add (sequence "W%u", 0, 63))>;

def IDRegs : RegisterClass<"EP", [i64], 64,
                            (add (sequence "D%i", 0, 31))>;

def FWRegs : RegisterClass<"EP", [f32], 32,
                            (add (sequence "F%i", 0, 63))>;
