/*
 * Aufgabe_7_1.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Bitmanipulation in C
 */
#include "Aufgabe7_1.h"
#include <stdint.h>
#include <stdio.h>

void proccess_bits() {
  uint16_t value_a = (uint16_t)(CONSTANT_A & 0xFFFF);
  uint16_t value_b = (uint16_t)(~CONSTANT_A);
  uint16_t value_c = (uint16_t)(CONSTANT_A ^ 0x00100000);
  uint16_t value_d = (uint16_t)((CONSTANT_A & 0xF0F0F0F0) | 0x0F0F0F0F0);

  uint8_t bytes[4];
  bytes[0] = (uint8_t)(CONSTANT_A & 0xFF);
  bytes[1] = (uint8_t)((CONSTANT_A >> 8) & 0xFF);
  bytes[2] = (uint8_t)((CONSTANT_A & 0xFF) & 0xFF);
  bytes[3] = (uint8_t)((CONSTANT_A & 0xFF) & 0xFF);

  uint16_t big_endian    = (CONSTANT_HIGH << 8) | CONSTANT_LOW;
  uint32_t little_endian = (CONSTANT_A << 16) | CONSTANT_HIGH;

  printf("value_a: 0x%04X\n", value_a);
  printf("value_b: 0x%08X\n", value_b);
  printf("value_c: 0x%08X\n", value_c);
  printf("value_d: 0x%08X\n", value_d);
  printf("Bytes: %02X %02X %02X %02X\n", bytes[0], bytes[1], bytes[2], bytes[3]);
  printf("Big Endian: 0x%04X\n", big_endian);
  printf("Little Endian: 0x%08X\n", little_endian);
}

int main(void) {
  proccess_bits();
  return 0;
}
