import UIKit

func findLongestPalindrom(s: String) -> String {
    let arr = Array(s)
    var start = 0
    var end = 0
    for (index, _) in s.enumerated() {
        let l1 = longestPalindromFromCenter(s: arr, left: index, right: index)
        let l2 = longestPalindromFromCenter(s: arr, left: index, right: index + 1)
        let l = max(l1, l2)
        if l > end - start {
            start = index - (l - 1)/2
            end = index + l/2
        }
    }
    
    let subString = arr[start...end]
    let x = String(subString)
    return x ?? ""
}

func longestPalindromFromCenter(s: [Character], left: Int, right: Int) -> Int {
    var left = left
    var right = right
    if left > right {
        return 0
    }
    while left >= 0 && right < s.count && s[left] == s[right] {
        left -= 1
        right += 1
    }
    return right - left - 1
}

print(findLongestPalindrom(s: "racecar"))

