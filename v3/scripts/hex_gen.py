def assemble_instruction(mnemonic, *operands):

    instruction_set = {
        "add16":  {"funct7": "0100", "funct3": "000", "opcode": "0110011"},
        "sub16":  {"funct7": "0100", "funct3": "001", "opcode": "0110011"},
        "stas16": {"funct7": "1111", "funct3": "010", "opcode": "0110011"},
        "stsa16": {"funct7": "1111", "funct3": "011", "opcode": "0110011"},
        "add8":   {"funct7": "0100", "funct3": "100", "opcode": "0110011"},
        "sub8":   {"funct7": "0100", "funct3": "101", "opcode": "0110011"},
        "sra16":  {"funct7": "0101", "funct3": "000", "opcode": "0110011"},
        "srai16": {"funct7": "0111", "funct3": "000", "opcode": "0110011"},
        "srl16":  {"funct7": "0101", "funct3": "001", "opcode": "0110011"},
        "srli16": {"funct7": "0111", "funct3": "001", "opcode": "0110011"},
        "sll16":  {"funct7": "0101", "funct3": "010", "opcode": "0110011"},
        "slli16": {"funct7": "0111", "funct3": "010", "opcode": "0110011"},
        "sra8":   {"funct7": "0101", "funct3": "100", "opcode": "0110011"},
        "srai8":  {"funct7": "0111", "funct3": "100", "opcode": "0110011"},
        "srl8":   {"funct7": "0101", "funct3": "101", "opcode": "0110011"},
        "srli8":  {"funct7": "0111", "funct3": "101", "opcode": "0110011"},
        "sll8":   {"funct7": "0101", "funct3": "110", "opcode": "0110011"},
        "slli8":  {"funct7": "0111", "funct3": "110", "opcode": "0110011"},
        "smul16": {"funct7": "1010", "funct3": "000", "opcode": "0110011"},
        "umul16": {"funct7": "1011", "funct3": "000", "opcode": "0110011"},
        "smul8":  {"funct7": "1010", "funct3": "100", "opcode": "0110011"},
        "umul8":  {"funct7": "1011", "funct3": "100", "opcode": "0110011"}
    }

    if mnemonic not in instruction_set:
        raise ValueError(f"Unknown instruction: {mnemonic}")

    instruction = instruction_set[mnemonic]
    
    funct7_padded = "000" + instruction["funct7"]  #pad with zeroes
    
    if len(operands) != 3:
        raise ValueError(f"Expected 3 operands for {mnemonic}, got {len(operands)}")

    rd = int(operands[0][1:])   # destination 
    rs1 = int(operands[1][1:])  # source r1
    rs2 = int(operands[2][1:])  # source r2

    for reg, name in [(rd, "rd"), (rs1, "rs1"), (rs2, "rs2")]:
        if not 0 <= reg <= 31:
            raise ValueError(f"Invalid register number for {name}: {reg}")

    binary_instruction = (
        f"{funct7_padded}"           # 7 bits
        f"{format(rs2, '05b')}"      # 5 bits
        f"{format(rs1, '05b')}"      # 5 bits
        f"{instruction['funct3']}"    # 3 bits
        f"{format(rd, '05b')}"       # 5 bits
        f"{instruction['opcode']}"    # 7 bits
    )

    hex_value = format(int(binary_instruction, 2), '08x')
    return f"0x{hex_value}"


mnemonic = "add16"
operands = ("x1", "x2", "x3")  
hex_code = assemble_instruction(mnemonic, *operands)
print(f"{mnemonic} {', '.join(operands)} = {hex_code}")

