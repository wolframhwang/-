#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <string>

using namespace std;

typedef long long ll;

const ll DIV = 1000000007;

int N;
string str;
ll dp[3];
ll answer;

void input() {
	cin >> N;
	cin >> str;

}

ll solve() {
	if (str[0] == 'W') { dp[0] = 1; }
	
	ll sum = 0;

	for (int i = 1; i < str.length(); i++) {
		if (str[i] == 'W') {
			dp[0] += 1;
		}
		else if (str[i] == 'H') {
			dp[1] = (dp[1] + dp[0]) % DIV;
		}
		else if (str[i] == 'E'){
			sum = (sum + dp[2]) % DIV;
			dp[2] += (dp[1] + dp[2]) % DIV;
		}
	}
	return sum;
}

int main() {
	ios::sync_with_stdio(0);
	cin.tie(0);

	input();
	ll answer = solve();
	cout << answer << '\n';

	return 0;
}
