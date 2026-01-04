# Channel Coding Techniques for OFDM Systems — BER Simulation (Paper Reproduction)

This repository contains a reproducible simulation study of **BER vs. SNR** performance for **OFDM systems** under different channel coding schemes.  
The work is based on a published reference paper and aims to reproduce the reported **performance trends** by implementing an end-to-end OFDM + FEC pipeline.

## Reference Paper
**“Performance Comparison of Channel Coding Techniques for OFDM Systems”**  
IOP Conference Series: Materials Science and Engineering, 2022  
DOI: 10.1088/1757-899X/1272/1/012012

> Note: This project is a *paper reproduction / simulation study*. The paper is not authored by me.

---

## Project Overview
The goal is to compare BER performance of OFDM transmission under:
- **Uncoded OFDM**
- **Convolutionally coded OFDM**
- **Reed–Solomon coded OFDM**

The output is the BER curve versus SNR under an **AWGN** channel, showing the coding gain compared to uncoded transmission.

---

## Implemented Pipeline
Each simulation follows the standard OFDM transmit/receive chain:
1. Random bit generation
2. (Optional) FEC encoding (Convolutional / Reed–Solomon)
3. Modulation mapping
4. OFDM modulation (IFFT)
5. Cyclic prefix insertion
6. AWGN channel
7. CP removal + FFT
8. Demodulation
9. (Optional) FEC decoding
10. BER computation over SNR range

---

## Repository Structure
- `uncoded_OFDM_BER_1.ipynb`  
  Simulation of **uncoded OFDM** BER vs. SNR.

- `conv_OFDM_BER.ipynb`  
  Simulation of **convolutionally coded OFDM** BER vs. SNR.

- `RS_OFDM_BER.ipynb`  
  Simulation of **Reed–Solomon coded OFDM** BER vs. SNR.

- `RS_decoder.m`  
  Optional Reed–Solomon decoding module (MATLAB) used for RS-coded OFDM simulation.

---

## Tools & Libraries
Python, NumPy, Matplotlib (and other common scientific libraries).  
Some Reed–Solomon decoding components may use MATLAB (optional).

---

## Notes
- This repository is prepared as a reproducibility-oriented simulation study.
- Exact BER values may vary depending on parameter choices (FFT size, CP length, modulation order, coding rate, number of bits), but the goal is to reproduce the overall performance trends reported in the reference paper.

---

## Author
Elina Shahri  
GitHub: https://github.com/elinashahri
