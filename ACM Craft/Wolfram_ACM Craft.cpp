#define _CRT_SECURE_NO_WARNINGS

#include <iostream>
#include <vector>

using namespace std;

const int MAX = 1001;

vector<int> map[MAX];

int point[MAX];
int visit[MAX];
bool notStartNode[MAX];
int cnt[MAX];
int N, K, T;

void init() {
	for (int i = 0; i <= N; i++) {
		map[i].clear();
		visit[i] = 0;
		notStartNode[i] = false;
	}

	for (int i = 1; i <= N; i++) {
		scanf("%d", &point[i]);
	}

	for (int i = 0; i < K; i++) {
		int a, b;
		scanf("%d %d", &a, &b);
		map[a].push_back(b);
		notStartNode[b] = true;
		cnt[b] += 1;
	}
	scanf("%d", &T);
}

void solve(int now) {
	if (map[now].size() == 0) {
		return;
	}
	for (int i = 0; i < map[now].size(); i++) {
		int next = map[now][i];
		cnt[next] -= 1;
		if (visit[next] < visit[now] + point[now]) {
			visit[next] = visit[now] + point[now];
		}		
		if (cnt[next] == 0) {
			solve(next);
		}
	}
}

int main() {
	int tc;
	scanf("%d", &tc);

	for (int i = 0; i < tc; i++) {
		scanf("%d %d", &N, &K);
		init();
		for (int i = 1; i <= N; i++) {
			if (!notStartNode[i]) {
				solve(i);
			}
		}
		printf("%d\n", visit[T] + point[T]);
	}
	return 0;
}
