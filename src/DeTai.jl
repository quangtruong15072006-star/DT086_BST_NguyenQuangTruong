module DeTai

export NutBST, chen, tim, tim_vet, duyet_giua, chieu_cao

# 1. BƯỚC 2: Kiểu nút cây nhị phân tìm kiếm
mutable struct NutBST
    khoa::Int
    trai::Union{NutBST, Nothing}
    phai::Union{NutBST, Nothing}
end

# Khởi tạo một nút mới (lá)
NutBST(x::Int) = NutBST(x, nothing, nothing)

# 2. BƯỚC: Hàm chèn trả về gốc mới (bỏ qua khóa trùng)
function chen(g::Union{NutBST, Nothing}, x::Int)
    if g === nothing
        return NutBST(x)
    end
    if x < g.khoa
        g.trai = chen(g.trai, x)
    elseif x > g.khoa
        g.phai = chen(g.phai, x)
    end
    # Nếu x == g.khoa: Bỏ qua khóa trùng theo quy định phiếu DT086
    return g
end

# 3. BƯỚC: Hàm tìm kiếm trả về true/false
function tim(g::Union{NutBST, Nothing}, x::Int)
    if g === nothing
        return false
    end
    if x == g.khoa
        return true
    elseif x < g.khoa
        return tim(g.trai, x)
    else
        return tim(g.phai, x)
    end
end

# BƯỚC(Bổ sung): Hàm tìm kiếm có trả về danh sách các nút đã so sánh
function tim_vet(g::Union{NutBST, Nothing}, x::Int)
    vet = Int[]
    curr = g
    while curr !== nothing
        push!(vet, curr.khoa)
        if x == curr.khoa
            return true, vet
        elseif x < curr.khoa
            curr = curr.trai
        else
            curr = curr.phai
        end
    end
    return false, vet
end

# 4. BƯỚC: Hàm duyệt giữa (Inorder) trả về dãy khóa sắp xếp
function duyet_giua(g::Union{NutBST, Nothing})
    kq = Int[]
    function duyet(nut)
        if nut !== nothing
            duyet(nut.trai)
            push!(kq, nut.khoa)
            duyet(nut.phai)
        end
    end
    duyet(g)
    return kq
end

# 4. BƯỚC: Hàm tính chiều cao cây (rỗng = 0, 1 nút = 1)
function chieu_cao(g::Union{NutBST, Nothing})
    if g === nothing
        return 0
    end
    return 1 + max(chieu_cao(g.trai), chieu_cao(g.phai))
end

end # module DeTai
