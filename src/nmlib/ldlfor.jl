function ldlfor!(a::Matrix{Float64}, b::Vector{Float64})
  n = size(a, 1)
  for i in 1:n
    total = b[i]
    if i > 1
      for j in 1:(i-1)
        total -= a[j, i] * b[j]
      end
      #(i=i, total=total, ad=a[i, i], newb=total / a[i, i]) |> display
    end
    b[i] = total / a[i, i]
    #i == 1 && (i=i, total=total, ad=a[i, i], newb=total / a[i, i]) |> display
  end
end

function ldlfor(a::Matrix{Float64}, b::Vector{Float64})
  bt = deepcopy(b)
  n = size(a, 1)
  for i in 1:n
    total = bt[i]
    if i > 1
      for j in 1:(i-1)
        total -= a[j, i] * bt[j]
      end
      #(i=i, total=total, ad=a[i, i], newb=total / a[i, i]) |> display
    end
    bt[i] = total / a[i, i]
    #i == 1 && (i=i, total=total, ad=a[i, i], newb=total / a[i, i]) |> display
  end
  bt
end

export
  ldlfor!,
  ldlfor
