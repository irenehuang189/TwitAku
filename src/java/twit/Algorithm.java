/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twit;

import java.util.Arrays;

/**
 *
 * @author Luqman A. Siswanto
 */
public class Algorithm {
  private final int ALPHABET_SIZE = 26;
  
  /**
   * Default konstruktor
   */
  public Algorithm() { 
  }
  
  /**
   * Menghitung fungsi border dari sebuah string
   * I. S. String hanya berisi lowercase a-z
   * @param s string yang akan di-compute fungsi bordernya
   * @return Array of integer : border function
   */
  public int[] computeKMP(String s) {
    int n = s.length();
    int[] a = new int[n];
    Arrays.fill(a, 0);
    for(int i = 1; i < n; i++) {
      int j = a[i - 1];
      while(j > 0 && s.charAt(i) != s.charAt(j)) j = a[j - 1];
      if(s.charAt(i) == s.charAt(j)) a[i] = j + 1;
    }
    //System.out.print("Func : ");
    /*for(int i = 0; i < n; i++) {
      System.out.print(a[i] + " ");
    }*/
    //System.out.println();
    return a;
  }
  
  /**
   * Menghitung pre-komputasi Boyer Moore
   * I. S. String hanya berisi lowercase a-z
   * @param s String yang akan dihitung Boyer-Moore
   * @return Matriks kemunculan terakhir
   */
  public int[][] computeBoyerMoore(String s) {
    int[][] b = new int[s.length()][ALPHABET_SIZE];
    for(int i = 0; i < s.length(); i++) {
      Arrays.fill(b[i], -1);
    }
    for(int i = 0; i < s.length(); i++) {
      for(int j = 0; j < ALPHABET_SIZE; j++) {
        if(i > 0) b[i][j] = b[i - 1][j];
      }
      b[i][s.charAt(i) - 'a'] = i;
    }
    return b;
  }
  
  /**
   * Mencocokkan sebuah pattern terhadap text
   * @param pattern Pattern yang akan dicocokkan
   * @param text Teks mentah tempat pattern akan dicocokkan
   */
  public int matchKmp(String pattern, String text) {
    pattern = pattern.toLowerCase();
    text = text.toLowerCase();
    int[] b = computeKMP(pattern);
    int j = 0;
    for(int i = 0; i < text.length();) {
      if(pattern.charAt(j) == text.charAt(i)) {
        i++; j++;
      } else if(j > 0) {
        j = b[j - 1];
      } else {
        i++;
      }
      if(j == pattern.length()) {
        return i - pattern.length();
      }
    }
    return -1;
  }
  
  /**
   * Mencocokkan sebuah pattern terhadap text
   * I. S. pattern hanya berisi satu kata
   * I. S. text hanya berisi karakter a-z atau A-Z
   * @param pattern Pattern yang akan dicocokkan
   * @param text Teks mentah tempat pattern akan dicocokkan
   */
  public int matchBoyerMoore(String pattern, String text) {
    pattern = pattern.toLowerCase();
    text = text.toLowerCase();
    int[][] b = computeBoyerMoore(pattern);
    int j = pattern.length() - 1;
    for(int i = pattern.length() - 1; i < text.length();) {
      if(pattern.charAt(j) == text.charAt(i)) {
        i--; j--;
        if(j == -1) {
          return i + 1;
        }
      } else {
        if(b[j][text.charAt(i) - 'a'] != -1) {
          i += pattern.length() - 1 - b[j][text.charAt(i) - 'a'];
        } else {
          i += pattern.length();
        }
        j = pattern.length() - 1;
      }
    }
    return -1;
  }
}