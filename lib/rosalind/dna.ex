defmodule Rosalind.DNA do
  @moduledoc """
  Counting DNA Nucleotides
  http://rosalind.info/problems/dna/

  Given: A DNA string s of length at most 1000 nt.

  Return: Four integers (separated by spaces) counting the respective number 
  of times that the symbols 'A', 'C', 'G', and 'T' occur in s.
  """

  @doc """
  # Tests

  iex> dataset = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  iex> result  = "20 12 17 21"
  iex> Rosalind.DNA.process(dataset) == result
  true

  # Dataset 1
  iex> dataset = "ATTAGATAAGTAGCCAACGCTGAGACCATGCTATTGGTATGAGTGTGGCATCTGTAAAGAATTGATTGTCACCAGTCGCGGGGAAAGATTTACATAGCTGTGAATGGGCCCTTTATGAAGCTGCTGGTAGCGACACCAGCGATGACGTCCCGTCCGTCGTAAGGTTGAAGGAGAAGCAAACTTCCCCGATGACTTTCAAGGCTACTGAGTTATCGAATTACGCCGTACTAACCCTGAACTGTGCATCATCAGGACGACTAGGGAGCCTGACTGTTTCAATCCCAGCGAAGTCGCCCATAACTCAAAAAGTCAGTAGTCATGCTTGTTGCACCGAGATCCCCCTAGATCGTATGATGCCTGAGGATATACGTTTACCGGGTAAGTGGTACATTTAACTGCGTGTAATGAGATGCAATGTTGTCCGCCATCCGGTGTCTAACCCCGGACCATCAGCATGCCGCTTCATTGAAGCTTTGATCAATACCCACATGGCTCAGACCATTTCCACCACCTCCCCCGTCTTTGAACTCGCCTATTAGGCTGCACTAATTAATGGAATCTAGACTCTATTCCATCCTAGTTAGAAAGACTAGTGTCATCATGGCAATAGGTTCTTTCTTCTTCCAGCGGCTCATCGCGTGCGAACAGTTCGTAAAAATAAAGGAACCGATAATGGCGTAGGCTAGACGTTGATCGCTTGCCCCTCCCTGTGATGTCGACTCGCCTTACCCGGGTTGTATTACACCAAGCAGTAGTGTGCTGTCCACCGGAGAACACAGTGCGGTGCTTGGGATTACGTCAATCCGAGCCGAAGCACCTACTAACTTCGTCTGTTGGCCCCCGGTACAGGATCTTACGCCTGGCAGCGATGAATTGTCACAATACAACGCATACCTTACGGCGAAGA"
  iex> result  = "231 233 213 230"
  iex> Rosalind.DNA.process(dataset) == result
  true

  """
  def process(s) do
    counts = %{"A" => 0, "C" => 0, "G" => 0, "T" => 0}

    String.graphemes(s)
    |> Enum.reduce(counts, 
      fn(char, acc) -> 
        Map.update!(acc, char, fn(value) -> value + 1 end) 
      end)
    |> Map.values
    |> Enum.join(" ")
  end
end