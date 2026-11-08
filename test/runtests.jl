using Test
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

@testset "DT086 - Bộ kiểm thử 12 ca tự động" begin
    # Ca 1: Dãy rỗng; tìm 2 -> false
    g1 = nothing
    @test tim(g1, 2) == false
    @test chieu_cao(g1) == 0

    # Ca 2: [5]; tìm 5 -> true
    g2 = chen(nothing, 5)
    @test tim(g2, 5) == true
    @test chieu_cao(g2) == 1

    # Ca 3: [5, 5, 5] -> chỉ một nút (bỏ qua trùng)
    g3 = nothing
    for x in [5, 5, 5] g3 = chen(g3, x) end
    @test duyet_giua(g3) == [5]
    @test chieu_cao(g3) == 1

    # Ca 4: [2, 1, 3] -> inorder [1, 2, 3], cao 2
    g4 = nothing
    for x in [2, 1, 3] g4 = chen(g4, x) end
    @test duyet_giua(g4) == [1, 2, 3]
    @test chieu_cao(g4) == 2

    # Ca 5: [1, 2, 3, 4] -> cao 4, tìm 4 đúng
    g5 = nothing
    for x in [1, 2, 3, 4] g5 = chen(g5, x) end
    @test chieu_cao(g5) == 4
    @test tim(g5, 4) == true

    # Ca 6: Kiểm tra số âm
    g6 = nothing
    for x in [-5, -10, -2] g6 = chen(g6, x) end
    @test duyet_giua(g6) == [-10, -5, -2]

    # Ca 7: Kiểm tra dãy giảm dần [4, 3, 2, 1]
    g7 = nothing
    for x in [4, 3, 2, 1] g7 = chen(g7, x) end
    @test chieu_cao(g7) == 4

    # Ca 8: Tìm phần tử không có trên cây [10, 20, 30], tìm 15 -> false
    g8 = nothing
    for x in [10, 20, 30] g8 = chen(g8, x) end
    @test tim(g8, 15) == false

    # Ca 9: Kiểm tra chèn trùng xen kẽ [5, 3, 5, 7, 3]
    g9 = nothing
    for x in [5, 3, 5, 7, 3] g9 = chen(g9, x) end
    @test duyet_giua(g9) == [3, 5, 7]

    # Ca 10: Cây 1 nút tìm phần tử khác -> false
    g10 = chen(nothing, 100)
    @test tim(g10, 200) == false

    # Ca 11: Cây cân bằng hoàn chỉnh [4, 2, 6, 1, 3, 5, 7]
    g11 = nothing
    for x in [4, 2, 6, 1, 3, 5, 7] g11 = chen(g11, x) end
    @test chieu_cao(g11) == 3

    # Ca 12: Kiểm tra duyệt giữa khi chèn lộn xộn [15, 8, 20, 3, 12]
    g12 = nothing
    for x in [15, 8, 20, 3, 12] g12 = chen(g12, x) end
    @test duyet_giua(g12) == [3, 8, 12, 15, 20]
end
