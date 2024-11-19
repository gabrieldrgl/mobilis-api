class CnpjUtils
  def self.valid?(cnpj)
    cnpj = cnpj.gsub(/[^\d]/, '') # Remove caracteres não numéricos

    return false if cnpj.length != 14 || cnpj.chars.uniq.size == 1

    # Calcula os dígitos verificadores
    numbers = cnpj[0..11].chars.map(&:to_i)

    first_verifier = calculate_verifier(numbers, [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2])
    second_verifier = calculate_verifier(numbers + [first_verifier], [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2])

    cnpj[-2..-1] == "#{first_verifier}#{second_verifier}"
  end

  def self.calculate_verifier(numbers, weights)
    sum = numbers.zip(weights).map { |num, weight| num * weight }.sum
    remainder = sum % 11
    remainder < 2 ? 0 : 11 - remainder
  end
end
