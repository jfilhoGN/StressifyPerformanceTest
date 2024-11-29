module Utils

using CSV
using Random
using JSON
using DataFrames

"""
    save_results_to_json(results::Dict, filepath::String)

Salva resultados em um arquivo JSON.
"""
function save_results_to_json(results::Dict, filepath::String)
    open(filepath, "w") do file
        write(file, JSON.json(results))
    end
end

"""
    random_csv_row(file_path::String)

Lê um arquivo CSV e retorna uma linha aleatória como `NamedTuple`.

### Parâmetros
- `file_path::String`: Caminho para o arquivo CSV.

### Retorno
- Um `NamedTuple` representando uma linha aleatória do arquivo CSV.
"""
function random_csv_row(file_path::String)
    if !isfile(file_path)
        throw(ArgumentError("O arquivo '$file_path' não foi encontrado ou não é válido."))
    end
    data = CSV.read(file_path, DataFrame)
    random_index = rand(1:nrow(data))
    return data[random_index, :]
end

"""
    random_json_object(file_path::String)

Lê um arquivo JSON e retorna um objeto aleatório do conteúdo.

### Parâmetros
- `file_path::String`: Caminho para o arquivo JSON.

### Retorno
- Um objeto aleatório do arquivo JSON (como um `Dict` ou `Array`).
"""
function random_json_object(file_path::String)
    if !isfile(file_path)
        throw(ArgumentError("O arquivo '$file_path' não foi encontrado ou não é válido."))
    end
    data = JSON.parsefile(file_path)
    random_index = rand(1:length(data))
    return data[random_index]
end

export save_results_to_json, random_csv_row, random_json_object

end
