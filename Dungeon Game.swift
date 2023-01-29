class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let M = dungeon.count, N = dungeon[0].count
        
        guard M > 0, N > 0 else { return 1 }
        
        var minHP = [[Int]](repeating: [Int](repeating: 1, count: N), count: M)
        
        for m in (0..<M).reversed() {
            for n in (0..<N).reversed() {
                switch true {
                case M - 1 == m && N - 1 == n: minHP[m][n] = max(1, 1 - dungeon[M-1][N-1])
                case M - 1 == m: minHP[m][n] = max(1, minHP[m][n+1] - dungeon[m][n])
                case N - 1 == n: minHP[m][n] = max(1, minHP[m+1][n] - dungeon[m][n])
                default: minHP[m][n] = max(1, min(minHP[m+1][n], minHP[m][n+1]) - dungeon[m][n])
                }
            }
        }
        return minHP[0][0]
    }
}