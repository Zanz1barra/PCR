import numpy as np
def submatrix(matrix, rows, cols, row_begin, col_begin, row_end, col_end):
    rows = rows - row_begin - (rows - 1 - row_end)
    cols = cols -col_begin - (cols - 1 - col_end)
    matrix2 = np.empty((rows, cols))
    for row in range(rows):
        for col in range(cols):
           matrix2[row][col] = matrix[row + row_begin][col + col_begin]
    return matrix2

# main part
f = np.genfromtxt('kr59_11000.txt', dtype = 'str') # open txt as np.array
size = f.shape # size of array
y_ish = submatrix(f, size[0], size[1], 0, 0, size[0] - 1, size[1] - 1)
y_ish = y_ish.transpose() # in numpy we need data vectors as rows!!! (matlab, matcad as cols)
Ry = np.cov(y_ish)
size_Ry = Ry.shape
eig_Y = np.linalg.eig(Ry)
eigvall_Y = eig_Y[0]
eigvec_Y = eig_Y[1]

# search of main component




print(eigvec_Y)

