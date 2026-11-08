include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

function chay_ca(ca::Int)
    println("=== CA ", ca, " ===")
    println("DT086 - CHEN VA TIM KIEM TRONG CAY NHI PHAN TIM KIEM (BST)")
    println("Quy uoc: Bo qua khoa trung")
    
    if ca == 1
        a = [5, 3, 7, 3]; khoa_tim = [3, 6]
        println("Mo ta: Vi du 1 (VD01)")
    elseif ca == 2
        a = [4, 2, 1]; khoa_tim = [4, 5]
        println("Mo ta: Vi du 2 (VD02)")
    elseif ca == 3
        a = [4, 2, 6, 1, 3, 5, 7]; khoa_tim = [6]
        println("Mo ta: Ca tu thiet ke 1 (TK01 - Cay can bang)")
    elseif ca == 4
        a = [-5, -10, -2, -15]; khoa_tim = [-2]
        println("Mo ta: Ca tu thiet ke 2 (TK02 - So am)")
    elseif ca == 5
        a = Int[]; khoa_tim = [2]
        println("Mo ta: Ca bien 1 (BIEN01 - Day rong)")
    elseif ca == 6
        a = [5]; khoa_tim = [5]
        println("Mo ta: Ca bien 2 (BIEN02 - Cay 1 nut)")
    elseif ca == 7
        a = [5, 5, 5]; khoa_tim = [5]
        println("Mo ta: Ca bien 3 (BIEN03 - Trung hoan toan)")
    elseif ca == 8
        a = [10, 20, 30]; khoa_tim = [15]
        println("Mo ta: Kiem tra tim khong thay (IO01)")
    end
    
    println("Day chen a = ", a)
    g = nothing
    for x in a g = chen(g, x) end
    println("Duyet giua (Inorder): ", duyet_giua(g))
    println("Chieu cao cay: ", chieu_cao(g))
    for k in khoa_tim
        found, trace = tim_vet(g, k)
        println("Tim ", k, ": ", found, " | Danh sach nut so sanh: ", trace)
    end
    println("[EXIT CODE: 0]")
end

function nhap_tu_ban_phim()
    println("=== DT086 - CHEN VA TIM KIEM TRONG CAY NHI PHAN TIM KIEM (BST) ===")
    println("Quy uoc: Bo qua khoa trung")
    
    print("Nhap day so nguyen can chen (cach nhau bang dau cach hoac phay): ")
    line_a = readline()
    a = [parse(Int, s) for s in split(replace(line_a, "," => " ")) if !isempty(strip(s))]
    
    print("Nhap cac khoa can tim (cach nhau bang dau cach hoac phay): ")
    line_k = readline()
    khoa_tim = [parse(Int, s) for s in split(replace(line_k, "," => " ")) if !isempty(strip(s))]
    
    println("\n--- KET QUA THUC THI ---")
    println("Mo ta: Nhap du lieu tu ban phim")
    println("Day chen a = ", a)
    g = nothing
    for x in a g = chen(g, x) end
    println("Duyet giua (Inorder): ", duyet_giua(g))
    println("Chieu cao cay: ", chieu_cao(g))
    for k in khoa_tim
        found, trace = tim_vet(g, k)
        println("Tim ", k, ": ", found, " | Danh sach nut so sanh: ", trace)
    end
    println("[EXIT CODE: 0]")
end

function main()
    ca_select = 0
    for arg in ARGS
        if startswith(arg, "--ca=")
            ca_select = parse(Int, split(arg, "=")[2])
        end
    end

    if ca_select >= 1 && ca_select <= 8
        chay_ca(ca_select)
    else
        nhap_tu_ban_phim()
    end
end

main()
