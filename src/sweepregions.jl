
"""
    @sweeprectregion xls, yls, s, algo

Generate the code to sweep a reticuled rectangular region in the plane (with
sides parallel to the coordinated axes) to apply certain algorithm to each
point in the reticle.

Such implemented algorithm can depend on this macro local variables:
- `ncols`: Number of points in the X direction for the reticle.
- `nrows`: Number of points in the Y direction for the reticle.
- `xmin`: Left X coordinate defining the rectangular region.
- `xmax`: Right X coordinate defining the rectangular region.
- `ymin`: Bottom Y coordinate defining the rectangular region.
- `ymax`: Top Y coordinate defining the rectangular region.
- `Δx`: \$\\Delta x=\\frac{xmax-xmin}{ncols}\$.
- `Δy`: \$\\Delta y=\\frac{ymax-ymin}{nrows}\$.
- `x`: X coordinate of the current point in the reticle.
- `y`: Y coordinate of the current point in the reticle.
- `i`: Column index of the current point in the reticle.
- `j`: Row index of the current point in the reticle.

#### Arguments
- `xls`: X limits of the rectangular region.
- `yls`: Y limits of the rectangular region.
- `s`: Size of the reticule (number of columns and rows of points).
- `algo`: Implemented algorithm.
"""
macro sweeprectregion(xls, yls, s, algo)
    esc(quote
        local xmin, xmax = $xls
        local ymin, ymax = $yls
        local ncols, nrows = $s
        local Δx, Δy = (xmax-xmin)/ncols, (ymax-ymin)/nrows
        local x, y = xmin, ymax
        for j ∈ 1:nrows
            x = xmin
            for i ∈ 1:ncols
                $algo
                x += Δx # Sweeping left to right
            end # for i ncols
            y -= Δy # Sweeping top to bottom
        end # for j nrows
    end) # quote
end # macro
