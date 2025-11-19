#include "cataleg.hpp"

cataleg::cataleg(const cataleg& c) {
    this->_taula = c->_taula;
    this->_M = c->_M;
    this->_quants = c->_quants;
}

cataleg::cataleg& operator=(const cataleg& c) {
    this->_taula = c->_taula;
    this->_M = c->_M;
    this->_quants = c->_quants;
    return *this;
}

cataleg::~cataleg() noexcept {

}

void cataleg::assig(const string &k, const Valor &v) {
    int i = h(k);
    node *p = _taula[i];
    bool trobat = false;
    while (p != nullptr and not trobat) {
        if (p->_k == k) {
            trobat = true;
        }
        else {
            p = p->_seg;
        }
    }
    if (trobat) {
        p->_v = v;
    }
    else {
        _taula[i] = new node(k, v, _taula[i]);
        _quants++;
    }
}

void cataleg::elimina(const string &k) {
    nat i = h(k);
    node *p = _taula[i], *ant = nullptr;
    bool trobat = false;
    while (p != nullptr and not trobat) {
        if (p->_k == k) {
            trobat = true;
        }
        else {
            ant = p;
            p = p->_seg;
        }
    }
    if (trobat) {
        if (ant == nullptr) {
            _taula[i] = p->_seg;
        }
        else {
            ant->seg = p->seg;
        }
        delete(p);
        _quants--;
    }
}

bool cataleg::existeix(const string &k) const noexcept {
    int i = h(k);
    node *p = _taula[i];
    bool trobat = false;
    while (p != nullptr and not trobat) {
        if (p->_k == k) {
            trobat = true;
        }
        else {
            p = p->_seg;
        }
    }
    return trobat;
}

Valor cataleg::operator[](const string &k) const {
    return k;
}

nat cataleg::quants() const noexcept {
    return _quants;
}