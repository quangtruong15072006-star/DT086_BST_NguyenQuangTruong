include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

println("==================================================")
println(" DEMO ĐỀ TÀI DT086 - CÂY NHỊ PHÂN TÌM KIẾM (BST)")
println(" Sinh viên: Nguyễn Quang Trường - MSSV: N24DCDT103")
println("==================================================\n")

# --- ÁNH A01: Ví dụ 1 ---
println("=== [ẢNH A01] VÍ DỤ 1 (VD01) ===")
a1 = [5, 3, 7, 3]
g1 = nothing
for x in a1 global g1 = chen(g1, x) end
println("Dãy chèn: ", a1)
println("Duyệt giữa (inorder): ", duyet_giua(g1))
println("Chiều cao cây: ", chieu_cao(g1))
f3, v3 = tim_vet(g1, 3)
println("Tìm 3: ", f3, " | Danh sách nút so sánh: ", v3)
f6, v6 = tim_vet(g1, 6)
println("Tìm 6: ", f6, " | Danh sách nút so sánh: ", v6)
println()

# --- ÁNH A02: Ví dụ 2 ---
println("=== [ẢNH A02] VÍ DỤ 2 (VD02) ===")
a2 = [4, 2, 1]
g2 = nothing
for x in a2 global g2 = chen(g2, x) end
println("Dãy chèn: ", a2)
println("Duyệt giữa (inorder): ", duyet_giua(g2))
println("Chiều cao cây: ", chieu_cao(g2))
f4, v4 = tim_vet(g2, 4)
println("Tìm 4: ", f4, " | Danh sách nút so sánh: ", v4)
f5, v5 = tim_vet(g2, 5)
println("Tìm 5: ", f5, " | Danh sách nút so sánh: ", v5)
println()

# --- ÁNH A03: Ca tự thiết kế 1 ---
println("=== [ẢNH A03] CA TỰ THIẾT KẾ 1 (TK01 - CÂY CÂN BẰNG) ===")
a3 = [4, 2, 6, 1, 3, 5, 7]
g3 = nothing
for x in a3 global g3 = chen(g3, x) end
println("Dãy chèn: ", a3)
println("Duyệt giữa: ", duyet_giua(g3))
println("Chiều cao: ", chieu_cao(g3))
f6_3, v6_3 = tim_vet(g3, 6)
println("Tìm 6: ", f6_3, " | Danh sách nút so sánh: ", v6_3)
println()

# --- ÁNH A04: Ca tự thiết kế 2 ---
println("=== [ẢNH A04] CA TỰ THIẾT KẾ 2 (TK02 - SỐ ÂM) ===")
a4 = [-5, -10, -2, -15]
g4 = nothing
for x in a4 global g4 = chen(g4, x) end
println("Dãy chèn: ", a4)
println("Duyệt giữa: ", duyet_giua(g4))
println("Chiều cao: ", chieu_cao(g4))
f_neg, v_neg = tim_vet(g4, -2)
println("Tìm -2: ", f_neg, " | Danh sách nút so sánh: ", v_neg)
println()

# --- ÁNH A05: Ca biên 1 ---
println("=== [ẢNH A05] CA BIÊN 1 (BIEN01 - DÃY RỖNG) ===")
g5 = nothing
println("Dãy chèn: []")
println("Duyệt giữa: ", duyet_giua(g5))
println("Chiều cao: ", chieu_cao(g5))
f2_5, v2_5 = tim_vet(g5, 2)
println("Tìm 2: ", f2_5, " | Danh sách nút so sánh: ", v2_5)
println()

# --- ÁNH A06: Ca biên 2 ---
println("=== [ẢNH A06] CA BIÊN 2 (BIEN02 - CÂY 1 NÚT) ===")
a6 = [5]
g6 = chen(nothing, 5)
println("Dãy chèn: ", a6)
println("Duyệt giữa: ", duyet_giua(g6))
println("Chiều cao: ", chieu_cao(g6))
f5_6, v5_6 = tim_vet(g6, 5)
println("Tìm 5: ", f5_6, " | Danh sách nút so sánh: ", v5_6)
println()

# --- ÁNH A07: Ca biên 3 ---
println("=== [ẢNH A07] CA BIÊN 3 (BIEN03 - TRÙNG HOÀN TOÀN) ===")
a7 = [5, 5, 5]
g7 = nothing
for x in a7 global g7 = chen(g7, x) end
println("Dãy chèn: ", a7)
println("Duyệt giữa: ", duyet_giua(g7))
println("Chiều cao: ", chieu_cao(g7))
f5_7, v5_7 = tim_vet(g7, 5)
println("Tìm 5: ", f5_7, " | Danh sách nút so sánh: ", v5_7)
println()

# --- ÁNH A08: Kiểm tra tìm không thấy ---
println("=== [ẢNH A08] KIỂM TRA TÌM KHÔNG THẤY (IO01) ===")
a8 = [10, 20, 30]
g8 = nothing
for x in a8 global g8 = chen(g8, x) end
println("Dãy chèn: ", a8)
println("Duyệt giữa: ", duyet_giua(g8))
println("Chiều cao: ", chieu_cao(g8))
f15_8, v15_8 = tim_vet(g8, 15)
println("Tìm 15: ", f15_8, " | Danh sách nút so sánh: ", v15_8)
println()