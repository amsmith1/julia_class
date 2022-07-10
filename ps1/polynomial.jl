function polynomial(x, coeff)
p=0
for (index, value) in enumerate(coeff)
        p = x^(index-1)*coeff[index] +p
end
p
end
