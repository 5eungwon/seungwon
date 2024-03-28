#include <iostream>
#include <string>
using namespace std;
char arr[5000000];   //메인문 박에다가 배열을 선언하면 힙에 메모리가 할당됨
int main() {
	long long int summ = 0;     /* 답을 저장할 변수 summ선언 long long int 로 선언한 이유는 5000000 / 6 이 833333 이고
	히든넘버의 최댓값이 999999이기때문에 833333 * 999999 의 값이 800억 정도되므로 그냥 int 형으로는 불가능*/
	int n;
	cin >> n;    //문자의 개수 입력
	for (int i = 0; i < n; i++) {
		cin >> arr[i];    //문자 n개 입력
	}
	string k = "";   //string형 변수 k 널값으로 선언
	for (int i = 0; i < n; i++) {  //arr 배열을 하나씩 전부 체크하는 for문
		if (arr[i] >= 48 && arr[i] <= 57) {   //문자를 하나씩 판별할 때 아스키코드 0부터 9 사이의 값인지 판별한 후 맞으면 문자열형 k에 더하기 
			k += arr[i];
		}
		else {   // 그렇지 않으면 k가 널값이 아닐때 stoi함수를 사용하여 k를 정수로 바꿔준값을 summ에 더해준다.
			if (k == "") {  //만약 k가 널값일때 stoi 함수를 사용해버리면 abort() 오류가 날수 있으므로 k가 널값일땐 continue
				continue;
			}
			summ += stoi(k);
			k = "";   
		}
	}
	if (k != "") {   // for문을 나오면서 한번더 k를 summ에 더해주는 과정 실행 (마지막 히든넘버 부분이 체크가 안됬을 수 있기 때문)
		summ += stoi(k);
		k = "";
	}
	cout << summ;  //답 출력
}